class FakeDataService
  module Constants
    JOB_TITLES = [
      'Ruby on Rails Developer',
      'Backend Developer',
      'Frontend Developer',
      'Fullstack Developer',
      'QA Tester',
      'Automation Tester',
      'Business Analyst',
      'Data Analyst',
      'DevOps Engineer',
      'Product Owner',
      'Project Manager',
      'UI/UX Designer',
      'Mobile Developer',
      'iOS Developer',
      'Android Developer',
      'Java Developer',
      'PHP Developer',
      'Python Developer',
      'Node.js Developer',
      'React Developer',
      'Vue.js Developer',
      'Sales Executive',
      'Marketing Executive',
      'Digital Marketing Specialist',
      'Customer Service Staff',
      'HR Officer',
      'Recruitment Specialist',
      'Accountant',
      'Admin Staff',
      'Store Manager'
    ].freeze

    COMPANIES = [
      {
        name: 'Tech Solutions Vietnam',
        website: 'https://techsolutions.vn'
      },
      {
        name: 'Digital Product Lab',
        website: 'https://digitalproductlab.vn'
      },
      {
        name: 'Creative Web Studio',
        website: 'https://creativewebstudio.vn'
      },
      {
        name: 'Quality First Co., Ltd',
        website: 'https://qualityfirst.vn'
      },
      {
        name: 'Fintech Innovation Vietnam',
        website: 'https://fintechinnovation.vn'
      },
      {
        name: 'Global Sales Company',
        website: 'https://globalsales.vn'
      },
      {
        name: 'Care Support Center',
        website: 'https://caresupport.vn'
      },
      {
        name: 'Brand Growth Agency',
        website: 'https://brandgrowth.vn'
      },
      {
        name: 'People First Vietnam',
        website: 'https://peoplefirst.vn'
      },
      {
        name: 'Insight Analytics',
        website: 'https://insightanalytics.vn'
      },
      {
        name: 'Green Retail Group',
        website: 'https://greenretail.vn'
      },
      {
        name: 'Smart Logistics Vietnam',
        website: 'https://smartlogistics.vn'
      },
      {
        name: 'NextGen Software',
        website: 'https://nextgensoftware.vn'
      },
      {
        name: 'Alpha Business Services',
        website: 'https://alphabusiness.vn'
      },
      {
        name: 'Blue Ocean Technology',
        website: 'https://blueocean.tech'
      }
    ].freeze

    SALARIES = [
      '7 triệu - 12 triệu',
      '10 triệu - 18 triệu',
      '12 triệu - 22 triệu',
      '15 triệu - 25 triệu',
      '18 triệu - 30 triệu',
      '20 triệu - 35 triệu',
      '25 triệu - 40 triệu',
      'Thỏa thuận'
    ].freeze

    LOCATIONS = [
      'Hồ Chí Minh',
      'Hà Nội',
      'Đà Nẵng',
      'Bình Dương',
      'Cần Thơ',
      'Đồng Nai',
      'Hải Phòng',
      'Bắc Ninh',
      'Long An',
      'Nghệ An'
    ].freeze

    CATEGORY_GROUPS = [
      ['IT - Software', 'Backend'],
      ['IT - Software', 'Frontend'],
      ['IT - Software', 'Ruby on Rails'],
      ['IT - Software', 'QA/QC'],
      ['Business Analyst', 'IT - Software'],
      ['Data', 'IT - Software'],
      ['Bán hàng / Kinh doanh'],
      ['Marketing', 'Digital Marketing'],
      ['Dịch vụ khách hàng', 'Tư vấn dịch vụ khách hàng'],
      ['Nhân sự', 'Hành chính'],
      ['Kế toán', 'Tài chính'],
      ['Logistics', 'Vận hành'],
      ['Thiết kế', 'UI/UX'],
      ['Quản lý dự án', 'IT - Software'],
      ['Bán lẻ', 'Cửa hàng']
    ].freeze

    DESCRIPTIONS = [
      [
        'Tiếp nhận data khách hàng tiềm năng do công ty cung cấp.',
        'Gọi điện tư vấn theo kịch bản có sẵn và giới thiệu sản phẩm phù hợp.',
        'Hướng dẫn, chăm sóc khách hàng trong quá trình tư vấn và sau bán hàng.',
        'Cập nhật thông tin khách hàng vào hệ thống quản lý.',
        'Báo cáo kết quả công việc cho cấp quản lý trực tiếp.'
      ],
      [
        'Phát triển và bảo trì các tính năng của hệ thống theo yêu cầu.',
        'Phối hợp với team để phân tích nghiệp vụ và đưa ra giải pháp kỹ thuật.',
        'Tối ưu hiệu năng ứng dụng và xử lý lỗi phát sinh trong quá trình vận hành.',
        'Tham gia review code và cải thiện chất lượng sản phẩm.',
        'Viết tài liệu kỹ thuật cho các chức năng được phụ trách.'
      ],
      [
        'Lập kế hoạch và triển khai các chiến dịch marketing online.',
        'Quản lý nội dung trên các kênh truyền thông của công ty.',
        'Theo dõi hiệu quả chiến dịch và đề xuất phương án tối ưu.',
        'Phối hợp với team thiết kế để sản xuất hình ảnh, video và bài viết.',
        'Báo cáo kết quả chiến dịch định kỳ cho quản lý.'
      ],
      [
        'Tiếp nhận và xử lý yêu cầu hỗ trợ từ khách hàng.',
        'Giải đáp thắc mắc qua điện thoại, email hoặc kênh chat online.',
        'Ghi nhận phản hồi của khách hàng và chuyển tiếp cho bộ phận liên quan.',
        'Theo dõi tiến độ xử lý vấn đề cho đến khi hoàn tất.',
        'Duy trì chất lượng dịch vụ và trải nghiệm khách hàng.'
      ]
    ].freeze

    BENEFITS = [
      [
        'Du lịch, teambuilding hằng năm.',
        'Quà sinh nhật, cưới hỏi, hiếu hỉ theo chính sách công ty.',
        'Có khu vực relax, căn tin và không gian làm việc thoải mái.',
        'Trang bị đầy đủ thiết bị làm việc.',
        'BHXH, BHYT, BHTN theo quy định nhà nước.',
        'Thử việc 2 tháng, 100% lương.',
        '12 ngày phép/năm và nghỉ lễ Tết theo quy định.',
        'Thưởng tháng 13 và thưởng theo hiệu quả công việc.',
        'Được đào tạo nghiệp vụ trước khi bắt đầu công việc.',
        'Môi trường làm việc hiện đại, năng động, đồng đội hỗ trợ tốt.'
      ],
      [
        'Lương cạnh tranh theo năng lực.',
        'Review lương định kỳ hằng năm.',
        'Thưởng dự án và thưởng hiệu suất làm việc.',
        'Được tham gia các khóa đào tạo chuyên môn.',
        'Cơ hội phát triển lên vị trí senior hoặc leader.',
        'Môi trường làm việc trẻ, cởi mở và hỗ trợ lẫn nhau.',
        'Hỗ trợ thiết bị làm việc.',
        'Chế độ bảo hiểm đầy đủ theo quy định.',
        'Company trip và hoạt động nội bộ định kỳ.',
        'Giờ làm việc linh hoạt tùy theo chính sách công ty.'
      ],
      [
        'Thu nhập ổn định và có thưởng KPI.',
        'Được đào tạo sản phẩm và kỹ năng bán hàng.',
        'Cơ hội thăng tiến lên trưởng nhóm.',
        'Môi trường làm việc năng động.',
        'Hỗ trợ chi phí gửi xe hoặc điện thoại tùy vị trí.',
        'Tham gia BHXH, BHYT, BHTN đầy đủ.',
        'Nghỉ phép năm theo quy định.',
        'Thưởng lễ, Tết và các dịp đặc biệt.',
        'Được tham gia teambuilding và du lịch công ty.',
        'Đồng nghiệp thân thiện, hỗ trợ trong công việc.'
      ]
    ].freeze

    REQUIREMENTS = [
      [
        'Giọng nói lưu loát, rõ ràng.',
        'Chăm chỉ, chịu khó và có trách nhiệm trong công việc.',
        'Giao tiếp tốt và có khả năng xử lý tình huống.',
        'Có tinh thần học hỏi và chủ động trong công việc.',
        'Được training từ đầu nếu chưa có kinh nghiệm.'
      ],
      [
        'Có kinh nghiệm làm việc với Ruby on Rails hoặc framework MVC tương tự.',
        'Hiểu biết về SQL, database design và RESTful API.',
        'Biết sử dụng Git trong quá trình phát triển phần mềm.',
        'Có tư duy logic, khả năng phân tích và giải quyết vấn đề.',
        'Có tinh thần teamwork và chủ động trao đổi khi gặp vấn đề.'
      ],
      [
        'Có kinh nghiệm ở vị trí tương đương là lợi thế.',
        'Sử dụng tốt các công cụ văn phòng cơ bản.',
        'Có khả năng làm việc độc lập và làm việc nhóm.',
        'Cẩn thận, trung thực và có trách nhiệm.',
        'Có khả năng học nhanh các quy trình và công cụ mới.'
      ],
      [
        'Có kỹ năng giao tiếp và chăm sóc khách hàng.',
        'Thái độ tích cực, thân thiện và kiên nhẫn.',
        'Có khả năng xử lý phản hồi và khiếu nại của khách hàng.',
        'Sử dụng máy tính cơ bản.',
        'Ưu tiên ứng viên từng làm trong lĩnh vực dịch vụ hoặc bán hàng.'
      ]
    ].freeze
  end
end
