# frozen_string_literal: true

require 'use_case/view_teams'
require 'gateway/google_spreadsheet'
require 'vcr'
require 'webmock/rspec'

describe 'the schedule' do
  VCR.configure do |config|
    config.cassette_library_dir = 'fixtures/vcr_cassettes'
    config.hook_into :webmock
    config.ignore_request { |request| request.uri == 'https://www.googleapis.com/oauth2/v4/token' }
  end

  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) { UseCase::ViewTeams.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }

  it 'views the first team' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first).to eq(
        client: 'Bob Corp',
        project: [
          {
            person: 'George',
            project_name: 'Project 1'
          },
          {
            person: 'Yusuf',
            project_name: 'Project 1'
          }
        ]
      )
    end
  end

  it 'views the first team' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:client]).to eq('Bob Corp')
    end
  end
end
