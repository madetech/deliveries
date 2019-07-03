require 'sinatra'
require_relative 'lib/use_case/view_teams.rb'

get '/' do
  erb :index, locals: { data: view_teams }
end

def view_teams
  UseCase::ViewTeams.new.execute
end
