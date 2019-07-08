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
        project: row[1],
        person: [row[4]],
        start_date: row[2],
        end_date: row[3],
        tech_lead: row[9],
        delivery_lead: row[10],
        client_partner: row[11],
        exec_sponsor: row[12]
      }
    end

    pp data.values
  end
end
