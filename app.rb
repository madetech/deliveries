# frozen_string_literal: true

require 'sinatra'
require 'zeitwerk'
require 'dotenv/load'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib/")
loader.enable_reloading
loader.setup

before { loader.reload }

get '/' do
  response = UseCase::ViewTeams.new(
    google_spreadsheet_gateway: Gateway::GoogleSpreadsheet.new
  ).execute
  erb :index, locals: { data: response }
end
