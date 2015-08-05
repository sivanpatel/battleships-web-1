require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'


  get '/' do
    erb :index
  end

  get '/name' do
  	@visitor = params[:name]
    session[:name] = @visitor
    session.each do |k,v|
      puts k
      puts v
    end
  	erb :name
  end

  get '/newgame' do
    game = Game.new Player, Board
    @matrix = game.own_board_view game.player_1
    @visitor = session[:name]
    session.each do |k,v|
      puts k
      puts v
    end
    puts @matrix
    puts @visitor
    erb :newgame
  end

  get '/battleship' do
    # game.player_1.place_ship Ship.aircraft_carrier
    # erb :battleship
    @visitor = session[:name]
    session.each do |k,v|
      puts k
      puts v
    end
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
