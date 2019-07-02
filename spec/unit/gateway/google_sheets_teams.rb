# frozen_string_literal: true
require 'gateway/google_spreadsheet'

describe Gateway::GoogleSpreadsheet do

  let(:response) do
    [["Amazon Web Services",
      "LGSS Data Centre Migration",
      "Ben Pirt",
     ["Amazon Web Services",
      "LGSS Data Centre Migration",
      "Robin Lacey"]]]
  end

  it 'can show all teams' do
    teams = described_class.new.all

    teams[0].tap do |row|
      expect(row[0]).to eq('Amazon Web Services')
      expect(row[1]).to eq('LGSS Data Centre Migration')
      expect(row[2]).to eq('Ben Pirt')
    end
  end
end
