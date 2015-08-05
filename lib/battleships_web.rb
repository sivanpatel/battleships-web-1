require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/name' do
  	@visitor = params[:name]
  	erb :name
  end

  get '/newgame' do
    erb :newgame
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
