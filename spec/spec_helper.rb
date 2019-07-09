# frozen_string_literal: true

require 'zeitwerk'
require 'vcr'
require 'dotenv/load'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../lib/")
loader.setup

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  begin
    config.filter_run_when_matching :focus
    config.order = :random
    Kernel.srand config.seed
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/test_double'
  config.hook_into :webmock
  config.ignore_request { |request| request.uri == 'https://www.googleapis.com/oauth2/v4/token' }
end
