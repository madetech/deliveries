# frozen_string_literal: true

require 'date'
require 'dotenv/load'
require 'sinatra'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib/")
loader.enable_reloading
loader.setup

before { loader.reload }

gateway = Sinatra::Application.environment == :development ? GoogleSheetsSimulator.new : Gateway::GoogleSpreadsheet.new

response = UseCase::ViewTeams.new(
  google_spreadsheet_gateway: gateway
).execute

get '/' do
  erb :index, locals: { data: response }
end

get '/present' do
  erb :present, locals: { data: response }
end
