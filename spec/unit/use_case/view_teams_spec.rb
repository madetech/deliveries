# frozen_string_literal: true

describe 'view deliverys' do
  VCR.configure do |config|
    config.cassette_library_dir = 'fixtures/vcr_cassettes'
    config.hook_into :webmock
    config.ignore_request { |request| request.uri == 'https://www.googleapis.com/oauth2/v4/token' }
  end

  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) { UseCase::ViewTeams.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }

  it 'can show client as the first key for the data' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first.keys[0]).to eq(:client)
    end
  end

  it 'can show project name as the first key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[0]).to eq(:project_name)
    end
  end

  it 'can show person as the second key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[1]).to eq(:person)
    end
  end

  it 'can show start date as the third key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[2]).to eq(:start_date)
    end
  end

  it 'can show end date as the fourth key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[3]).to eq(:end_date)
    end
  end

  it 'can show tech lead as the fifth key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[4]).to eq(:tech_lead)
    end
  end

  it 'can show delivery lead as the sixth key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[5]).to eq(:delivery_lead)
    end
  end

  it 'can show client partner as the seventh key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[6]).to eq(:client_partner)
    end
  end

  it 'can show exec sponsor as the eigth key on the first active work stream' do
    VCR.use_cassette('response') do
      response = view_teams.execute
      expect(response.first[:project][0].keys[7]).to eq(:exec_sponsor)
    end
  end
end
