class FakeDataService
  include Constants

  def initialize(jobs_count: 150, companies_count: 15, clear_db: false)
    @jobs_count = jobs_count
    @companies_count = companies_count
    @clear_db = clear_db
  end

  def call
    clear_database if @clear_db
    crawl_log = start_crawl_log
    jobs = fake_jobs

    total_found = jobs.size
    total_created = 0
    total_updated = 0

    begin
      ActiveRecord::Base.transaction do
        jobs.each do |job_data|
          result = save_job(job_data)

          total_created += 1 if result == :created
          total_updated += 1 if result == :updated
        end
      end

      complete_crawl_log(
        crawl_log,
        total_found: total_found,
        total_created: total_created,
        total_updated: total_updated
      )
    rescue StandardError => e
      fail_crawl_log(crawl_log, e)
      raise e
    end
  end

  private

  def clear_database
    raise 'Cannot clear database in production environment!' if Rails.env.production?

    JobCategory.delete_all
    Job.delete_all
    Company.delete_all
    Location.delete_all
    Category.delete_all
    CrawlLog.delete_all
  end

  def fake_jobs
    companies = COMPANIES.take(@companies_count)
    companies = COMPANIES if companies.empty?
    today = Date.current

    (1..@jobs_count).map do |index|
      title = JOB_TITLES[index % JOB_TITLES.size]
      company = companies[index % companies.size]
      company_name = company[:name]
      company_website = company[:website]
      location_name = LOCATIONS[index % LOCATIONS.size]
      salary = SALARIES[index % SALARIES.size]
      category_names = CATEGORY_GROUPS[index % CATEGORY_GROUPS.size]
      description = DESCRIPTIONS[index % DESCRIPTIONS.size]
      benefit = BENEFITS[index % BENEFITS.size]
      requirements = REQUIREMENTS[index % REQUIREMENTS.size]

      {
        title: "#{title} ##{index}",
        company_name: company_name,
        company_website: company_website,
        salary: salary,
        location_name: location_name,
        description: build_content(description),
        benefit: build_content(benefit),
        requirements: build_content(requirements),
        category_names: category_names,
        posted_date: today - (index % 30).days,
        original_url: "https://www.careerlink.vn/tim-viec-lam/fake-job-#{index}/#{100000 + index}"
      }
    end
  end

  def build_content(items)
    items.map { |item| "- #{item}" }.join("\n")
  end

  def start_crawl_log
    CrawlLog.create!(
      source: 'fake_careerlink',
      status: 'running',
      started_at: Time.current
    )
  end

  def complete_crawl_log(crawl_log, total_found:, total_created:, total_updated:)
    crawl_log.update!(
      status: 'completed',
      total_found: total_found,
      total_created: total_created,
      total_updated: total_updated,
      finished_at: Time.current
    )
  end

  def fail_crawl_log(crawl_log, error)
    crawl_log.update!(
      status: 'failed',
      error_message: error.message,
      finished_at: Time.current
    )
  end

  def save_job(job_data)
    company = find_or_create_company(job_data[:company_name], job_data[:company_website])
    location = find_or_create_location(job_data[:location_name])
    categories = find_or_create_categories(job_data[:category_names])

    job = Job.find_or_initialize_by(original_url: job_data[:original_url])
    new_record = job.new_record?

    job.assign_attributes(
      title: job_data[:title],
      salary: job_data[:salary],
      description: job_data[:description],
      requirements: job_data[:requirements],
      benefit: job_data[:benefit],
      posted_date: job_data[:posted_date],
      company: company,
      location: location,
      categories: categories
    )

    job.save!

    new_record ? :created : :updated
  end

  def find_or_create_company(name, website)
    clean_name = name.presence || 'Unknown Company'
    @company_cache ||= {}
    @company_cache[clean_name] ||= begin
      company = Company.find_or_create_by!(name: clean_name)
      company.update!(website: website) if website.present? && company.website.blank?
      company
    end
  end

  def find_or_create_location(name)
    clean_name = name.presence || 'Unknown Location'
    @location_cache ||= {}
    @location_cache[clean_name] ||= Location.find_or_create_by!(name: clean_name)
  end

  def find_or_create_categories(names)
    category_names = names.presence || ['Other']
    @category_cache ||= {}

    category_names.uniq.map do |name|
      clean_name = name.presence || 'Other'
      @category_cache[clean_name] ||= Category.find_or_create_by!(name: clean_name)
    end
  end
end
