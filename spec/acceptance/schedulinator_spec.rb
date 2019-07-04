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


  it 'views the first client' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:client]).to eq('Amazon Web Services')
    end
  end

  it 'views the first active work stream within the client' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:project].first[:project_name]).to eq('LGSS Data Centre Migration')
    end
  end

  it 'views the first person in the active work stream' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:project].first[:person]).to eq('Ben Pirt')
    end
  end

  it 'views the second person in the active work stream' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:project][1][:person]).to eq('Robin Lacey')
    end
  end

  it 'views the account structure of the first person in the first workstream' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:project].first[:tech_lead]).to eq('TRUE')
      expect(response.first[:project].first[:delivery_lead]).to eq('TRUE')
      expect(response.first[:project].first[:client_partner]).to eq('TRUE')
      expect(response.first[:project].first[:exec_sponsor]).to eq('TRUE')
    end
  end

  it 'views the account structure of the second person in the first workstream' do
    VCR.use_cassette('account_structure') do
      response = view_teams.execute
      expect(response.first[:project][1][:tech_lead]).to eq('TRUE')
      expect(response.first[:project][1][:delivery_lead]).to eq('FALSE')
      expect(response.first[:project][1][:client_partner]).to eq('FALSE')
      expect(response.first[:project][1][:exec_sponsor]).to eq('TRUE')
    end
  end
end
