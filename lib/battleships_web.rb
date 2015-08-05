require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/name' do
  	@visitor = params[:name]
  	erb :name
  end

  get '/newgame' do
    game = Game.new Player, Board
    @matrix = game.own_board_view game.player_1
    puts @matrix
    erb :newgame
  end

  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
