# frozen_string_literal: true

class UseCase::ViewTeams
  def initialize(google_spreadsheet_gateway:)
    @google_spreadsheet_gateway = google_spreadsheet_gateway
  end

  def execute
    data = {}

    @google_spreadsheet_gateway.all.each do |row|
      data[row[0]] ||= {
        client: row[0]
      }
      data[row[0]][:project] ||= []
      data[row[0]][:project] << {
        project_name: row[1],
        start_date: row[2],
        end_date: row[3],
        person: [row[4]],
        tech_lead: row[6],
        delivery_lead: row[7],
        client_partner: row[8],
        exec_sponsor: row[9]
      }
    end

    data.values
  end
end
