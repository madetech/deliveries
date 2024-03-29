# frozen_string_literal: true

require 'google/apis/sheets_v4'
require 'googleauth'

class Gateway::GoogleSpreadsheet
  def all
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = 'Some application name'
    service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
    )
    spreadsheet_id = '1nX4mjdRJqceaPpfbflGn-s2pvwlVuUSLuLHyWP-4mC4'
    range = 'Teams 4 Weeks FINAL!A1:M'

    response = service.get_spreadsheet_values(spreadsheet_id, range)

    response.values.drop(2)
  end
end
