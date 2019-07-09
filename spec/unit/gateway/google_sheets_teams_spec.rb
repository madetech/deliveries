# frozen_string_literal: true

describe Gateway::GoogleSpreadsheet do
  VCR.use_cassette('response') do
    rows = described_class.new.all
    context 'viewing the first clients data' do
      context 'when viewing the first work stream' do
        it 'can show the first person' do
          rows[0].tap do |row|
            expect(row[0]).to eq('Client ONE')
            expect(row[1]).to eq('Work Stream ONE')
            expect(row[2]).to eq('2019-05-02')
            expect(row[3]).to eq('2019-06-06')
            expect(row[4]).to eq('Yusuf Sheikh')
            expect(row[6]).to eq('TRUE')
            expect(row[7]).to eq('TRUE')
            expect(row[8]).to eq('TRUE')
            expect(row[9]).to eq('TRUE')
          end
        end
      end
    end

    context 'viewing the second clients data' do
      context 'when viewing the first work stream' do
        it 'can show the first person' do
          rows[1].tap do |row|
            expect(row[0]).to eq('Client TWO')
            expect(row[1]).to eq('Work Stream ONE')
            expect(row[2]).to eq('2019-05-01')
            expect(row[3]).to eq('2019-10-31')
            expect(row[4]).to eq('George Schena')
            expect(row[6]).to eq('TRUE')
            expect(row[7]).to eq('TRUE')
            expect(row[8]).to eq('TRUE')
            expect(row[9]).to eq('TRUE')
          end
        end

        it 'can show the second person' do
          rows[2].tap do |row|
            expect(row[0]).to eq('Client TWO')
            expect(row[1]).to eq('Work Stream ONE')
            expect(row[2]).to eq('2019-05-01')
            expect(row[3]).to eq('2019-10-31')
            expect(row[4]).to eq('Maysa Kanoni')
            expect(row[6]).to eq('FALSE')
            expect(row[7]).to eq('FALSE')
            expect(row[8]).to eq('FALSE')
            expect(row[9]).to eq('FALSE')
          end
        end
      end

      context 'when viewing the second work stream' do
        it 'can show the first person' do
          rows[3].tap do |row|
            expect(row[0]).to eq('Client TWO')
            expect(row[1]).to eq('Work Stream TWO')
            expect(row[2]).to eq('2019-07-15')
            expect(row[3]).to eq('2019-09-02')
            expect(row[4]).to eq('Maysa Kanoni')
            expect(row[6]).to eq('TRUE')
            expect(row[7]).to eq('TRUE')
            expect(row[8]).to eq('TRUE')
            expect(row[9]).to eq('TRUE')
          end
        end
      end
    end
  end
end
