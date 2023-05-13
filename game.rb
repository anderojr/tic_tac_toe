require_relative 'board'
require_relative 'player'

class Game
  def initialize(player_one, player_two)
    @board = Board.new
    @player1 = Player.new(player_one, 'X')
    @player2 = Player.new(player_two, 'O')
    @current_player = @player1
  end

  def play
    loop do
      @board.display

      position = get_valid_position
      @board.update(position[0], position[1], @current_player.symbol)

      if @board.win?
        puts "Player #{@current_player.name} wins!"
        break
      elsif @board.full?
        puts "It's a draw!"
        break
      end

      switch_players
    end
  end

  private

  def get_valid_position
    loop do
      puts "Player #{@current_player.name}"
      print 'Enter row (1-3): '
      row = gets.chomp.to_i - 1
      print 'Enter column (1-3): '
      col = gets.chomp.to_i - 1

      return [row, col] if @board.valid_move?(row, col)

      puts 'Invalid move. Please try again.'
    end
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
