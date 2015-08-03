require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  
  get '/' do
    'Hello BattleshipsWeb!'
    erb :index
  end

  get '/NewPage' do 
  	@visitor = params[:name]
  	erb :index
  end 

  set :views, Proc.new { File.join(root, "..", "views") }
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
