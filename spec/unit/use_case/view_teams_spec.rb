# frozen_string_literal: true

describe UseCase::ViewTeams do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) { described_class.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_teams.execute }

  it 'can show client as the first key for the data' do
    VCR.use_cassette('response') do
      expect(response.first.keys[0]).to eq(:client)
    end
  end

  it 'can show project as the first key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[0]).to eq(:project_name)
    end
  end

  it 'can show start date as the second key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[1]).to eq(:start_date)
    end
  end

  it 'can show end date as the third key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[2]).to eq(:end_date)
    end
  end

  it 'can show person as the fourth key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[3]).to eq(:person)
    end
  end

  it 'can show tech lead as the fifth key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[4]).to eq(:tech_lead)
    end
  end

  it 'can show delivery lead as the sixth key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[5]).to eq(:delivery_lead)
    end
  end

  it 'can show client partner as the seventh key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[6]).to eq(:client_partner)
    end
  end

  it 'can show exec sponsor as the eigth key on the first active work stream' do
    VCR.use_cassette('response') do
      expect(response.first[:project][0].keys[7]).to eq(:exec_sponsor)
    end
  end
end
