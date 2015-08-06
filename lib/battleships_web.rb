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
    $game.player_2.place_ship Ship.submarine, 'A1', :horizontally
    # $game.player_2.place_ship Ship.destroyer, 'B3', :vertically
    # $game.player_2.place_ship Ship.cruiser, 'F2', :horizontally
    # $game.player_2.place_ship Ship.battleship, 'J3', :vertically
    # $game.player_2.place_ship Ship.aircraft_carrier, 'A10', :horizontally
    erb :newgame
  end

  post '/newgame' do
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @direction = params[:direction]
    @shoot_at = params[:shoot_at]
    $game.player_1.place_ship Ship.send(@ship), @coordinate.capitalize, @direction.to_sym
    puts @shoot_at
    erb :newgame
  end

  get '/play_single' do
    @visitor = session[:name]
    erb :play_single
  end

  post '/play_single' do
    @coords = params[:coord]
    $game.player_1.shoot @coords.capitalize.to_sym
    $game.player_2.shoot random_coord.to_sym
    redirect '/result' if $game.has_winner? == true
    erb :play_single
  end

  get '/result' do
    @visitor = session[:name]
    erb :result
  end


  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0



  def random_coord
    letter = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].sample
    number = rand(1..10).to_s
    letter + number
  end

end
