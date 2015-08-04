require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/newgame' do
  	@visitor = params[:name]
  	erb :newgame
  end

  get '/game' do
    erb :game
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
