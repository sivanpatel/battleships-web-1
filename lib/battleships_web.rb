require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  # use Rack::Session::Cookie, :key => 'rack.session',
  #                          :path => '/',
  #                          :secret => 'your_secret'


enable :sessions

  get '/' do
    erb :index
  end

  get '/name' do
  	@visitor = params[:name]
    session[:name] = @visitor
  	erb :name
  end

  get '/newgame' do
    $game = Game.new Player, Board
    @visitor = session[:name]
    puts @visitor
    erb :newgame
  end

  post '/newgame' do
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @direction = params[:direction]
    $game.player_1.place_ship Ship.send(@ship), @coordinate.capitalize, @direction.to_sym
    $game.player_2.place_ship Ship.send(@ship), random_coord, random_direction

    erb :newgame
  end



  get '/battleship' do
    # game.player_1.place_ship Ship.aircraft_carrier
    # erb :battleship
    @visitor = session[:name]
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0



  def random_coord
    letter = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].sample
    number = rand(1..10).to_s
    letter + number
  end
  def random_direction
    direction = [:horizontally, :vertically].sample
  end
end
