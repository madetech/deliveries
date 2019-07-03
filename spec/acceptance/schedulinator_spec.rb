# frozen_string_literal: true
require 'use_case/view_teams'
require 'gateway/google_spreadsheet'

describe 'the schedule' do

  let(:google_spreadsheet_gateway) { Gateway::GoogleSpreadsheet.new }
  let(:view_teams) do
    UseCase::ViewTeams.new(google_spreadsheet_gateway: google_spreadsheet_gateway)
  end

  it 'views the spreadsheet' do
    response = view_teams.execute
    expect(response).to eq(
      [{:client=>"Amazon Web Services",
        :project=>
         [{:project_name=>"LGSS Data Centre Migration", :person=>"Ben Pirt"},
          {:project_name=>"LGSS Data Centre Migration", :person=>"Robin Lacey"}]},
       {:client=>"Department for Education",
        :project=>
         [{:project_name=>"Apply PO 41070009579", :person=>"Barry Anderson"},
          {:project_name=>"Apply PO 41070009579", :person=>"Heidar Bernhardsson"},
          {:project_name=>"Apply PO41070009580", :person=>"Kyle Chapman"},
          {:project_name=>"Single Place for Education (SPFE)",
           :person=>"Daniel Burnley"},
          {:project_name=>"Single Place for Education (SPFE)",
           :person=>"Robert McHugh"},
          {:project_name=>"Single Place for Education (SPFE)",
           :person=>"Wen Ting Wang"},
          {:project_name=>"TVS Part II", :person=>"Adrian Clay"},
          {:project_name=>"TVS Part II", :person=>"Dushan Despotovic"},
          {:project_name=>"TVS Part II", :person=>"Omorinsola Fadoju"}]},
       {:client=>"London Borough of Hackney",
        :project=>
         [{:project_name=>"Manage a Tenancy (ETRA)", :person=>"Ben Pirt"},
          {:project_name=>"Manage a Tenancy (ETRA)", :person=>"Daniel Williams"},
          {:project_name=>"Manage a Tenancy (ETRA)", :person=>"Jeff Pinkham"},
          {:project_name=>"Manage a Tenancy (ETRA)", :person=>"Mark Sta Ana"},
          {:project_name=>"Manage a Tenancy (ETRA)", :person=>"Maysa Kanoni"},
          {:project_name=>"Manage Arrears: Support and Maintenance extension",
           :person=>"Mark Sta Ana"}]},
       {:client=>"Made Tech",
        :project=>
         [{:project_name=>"Chalet", :person=>"Cormac Brady"},
          {:project_name=>"Chalet", :person=>"Csaba Gyorfi"},
          {:project_name=>"Chalet", :person=>"Faissal Bensefia"}]},
       {:client=>"Ministry of Justice",
        :project=>
         [{:project_name=>"Form Builder", :person=>"Elena Vilimaite"},
          {:project_name=>"Form Builder", :person=>"Emile Swarts"},
          {:project_name=>"Form Builder", :person=>"Tom Taylor"}]},
       {:client=>"Smartwyre Inc",
        :project=>
         [{:project_name=>"Smartwyre", :person=>"Chris Parsons"},
          {:project_name=>"Smartwyre", :person=>"Daniel O'Sullivan"},
          {:project_name=>"Smartwyre", :person=>"David Capper"},
          {:project_name=>"Smartwyre", :person=>"Emma Corbett"},
          {:project_name=>"Smartwyre", :person=>"Jaseera Abubacker"},
          {:project_name=>"Smartwyre", :person=>"Kelly Fragkogianni"},
          {:project_name=>"Smartwyre", :person=>"Mark Sta Ana"},
          {:project_name=>"Smartwyre", :person=>"Rebecca Fitzsimmons"},
          {:project_name=>"Smartwyre", :person=>"Richard Foster"},
          {:project_name=>"Smartwyre", :person=>"Steven Leighton"},
          {:project_name=>"Smartwyre", :person=>"Tito Sarrionandia"}]}]
      )
  end
end
