# frozen_string_literal: true

require 'gateway/google_spreadsheet'
require 'vcr'

describe Gateway::GoogleSpreadsheet do
  VCR.configure do |config|
    config.cassette_library_dir = 'fixtures/vcr_cassettes'
    config.hook_into :webmock
    config.ignore_request { |request| request.uri == 'https://www.googleapis.com/oauth2/v4/token' }
  end

  context 'getting the first clients data' do
    VCR.use_cassette('response') do
      response = described_class.new.all

      it 'can show the first client' do
        expect(response[0][0]).to eq('Bob Corp')
      end

      it 'can show the first active work stream' do
        expect(response[0][1]).to eq('Project 1')
      end

      it 'can show the people working on the project' do
        expect(response[0][2]).to eq('George')
      end

      it 'can show the people working on the project' do
        expect(response[1][2]).to eq('Yusuf')
      end
    end
  end
end
