# frozen_string_literal: true
require 'use_case/view_teams'
require 'gateway/google_spreadsheet'

describe 'the schedule' do

  let(:response) do
    [["Amazon Web Services",
      "LGSS Data Centre Migration",
      "Ben Pirt",
      "146.29",
      "7",
      "7",
      "7",
      "7",
      "28"],
     ["Amazon Web Services",
      "LGSS Data Centre Migration",
      "Robin Lacey",
      "146.29",
      "31.5",
      "31.5",
      "31.5",
      "31.5",
      "126"]]
  end

  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) do
    UseCase::ViewTeams.new(google_spreadsheet_gateway: google_spreadsheet_gateway)
  end

  it 'views the spreadsheet' do
    response = view_teams.execute
    expect(response[:teams]).to
      eq(
        [{:client=>"Amazon Web Services",
          :project=>
           [{:project_name=>"LGSS Data Centre Migration", :person=>"Ben Pirt"},
            {:project_name=>"LGSS Data Centre Migration", :person=>"Robin Lacey"}]}
        ]
      )
  end
end
