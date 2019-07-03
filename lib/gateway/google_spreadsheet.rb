require 'google_drive'

module Gateway
  class GoogleSpreadsheet
    def all
      session = GoogleDrive::Session.from_config('config.json')
      ws = session.spreadsheet_by_key('1nX4mjdRJqceaPpfbflGn-s2pvwlVuUSLuLHyWP-4mC4').worksheet_by_title('Teams 4 Weeks FINAL')

      ws.rows.each { |row| row.first(3) }.drop(2)
    end
  end
end
