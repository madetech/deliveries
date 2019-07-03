require_relative '../gateway/google_spreadsheet.rb'

module UseCase
  class ViewTeams
    def initialize(google_spreadsheet_gateway: google_spreadsheet_gateway)
      @google_spreadsheet_gateway = google_spreadsheet_gateway
    end

    def execute
      projects = Gateway::GoogleSpreadsheet.new.all

      data = {}
      projects.each do |row|
        data[row[0]] ||= {
          client: row[0]
        }
        data[row[0]][:project] ||= []
        data[row[0]][:project] << {
          project_name: row[1],
          person: row[2]
        }
      end
      data.values
    end
  end
end
