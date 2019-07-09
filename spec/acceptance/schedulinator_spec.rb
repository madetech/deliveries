# frozen_string_literal: true

describe 'the schedulinator' do
  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) { UseCase::ViewTeams.new(google_spreadsheet_gateway: google_spreadsheet_gateway) }
  let(:response) { view_teams.execute }

  it 'views all delivery teams' do
    VCR.use_cassette('response') do
      expect(response).to eq(
        [
          {
            client: 'Client ONE',
            project: [
              {
                project_name: 'Work Stream ONE',
                start_date: '2019-05-02',
                end_date: '2019-06-06',
                person: ['Yusuf Sheikh'],
                tech_lead: 'TRUE',
                delivery_lead: 'TRUE',
                client_partner: 'TRUE',
                exec_sponsor: 'TRUE'
              }
            ]
          },
          {
            client: 'Client TWO',
            project: [
              {
                project_name: 'Work Stream ONE',
                start_date: '2019-05-01',
                end_date: '2019-10-31',
                person: ['George Schena'],
                tech_lead: 'TRUE',
                delivery_lead: 'TRUE',
                client_partner: 'TRUE',
                exec_sponsor: 'TRUE'
              },
              {
                project_name: 'Work Stream ONE',
                start_date: '2019-05-01',
                end_date: '2019-10-31',
                person: ['Maysa Kanoni'],
                tech_lead: 'FALSE',
                delivery_lead: 'FALSE',
                client_partner: 'FALSE',
                exec_sponsor: 'FALSE'
              },
              {
                project_name: 'Work Stream TWO',
                start_date: '2019-07-15',
                end_date: '2019-09-02',
                person: ['Maysa Kanoni'],
                tech_lead: 'TRUE',
                delivery_lead: 'TRUE',
                client_partner: 'TRUE',
                exec_sponsor: 'TRUE'
              }
            ]
          }
        ]
      )
    end
  end

  it 'views the first client' do
    VCR.use_cassette('response') do
      expect(response.first[:client]).to eq('Client ONE')

      expect(response.first[:project].first[:project_name]).to eq('Work Stream ONE')
      expect(response.first[:project].first[:person]).to eq(['Yusuf Sheikh'])

      expect(response.first[:project].first[:tech_lead]).to eq('TRUE')
      expect(response.first[:project].first[:delivery_lead]).to eq('TRUE')
      expect(response.first[:project].first[:client_partner]).to eq('TRUE')
      expect(response.first[:project].first[:exec_sponsor]).to eq('TRUE')
    end
  end
end
