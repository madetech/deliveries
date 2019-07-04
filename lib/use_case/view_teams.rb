# frozen_string_literal: true

class UseCase::ViewTeams
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    projects = Gateway::GoogleSpreadsheet.new.all

    data = {}
    @google_spreadsheet_gateway.all.each do |row|
      data[row[0]] ||= {
        client: row[0]
      }
      data[row[0]][:project] ||= []
      data[row[0]][:project] << {
        project_name: row[1],
        person: row[2],
        tech_lead: row[9],
        delivery_lead: row[10],
        client_partner: row[11],
        exec_sponsor: row[12]
      }
    end
    data.values
  end
end
