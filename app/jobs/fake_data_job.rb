class FakeDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    options = args.extract_options!
    FakeDataService.new(**options).call
  end
end
