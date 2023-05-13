class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    puts '---------'
    @board.each do |row|
      puts row.join(' | ')
      puts '---------'
    end
  end

  def update(row, col, symbol)
    @board[row][col] = symbol
  end

  def valid_move?(row, col)
    @board[row][col] == ' '
  end

  def full?
    @board.all? { |row| row.none? { |cell| cell == ' ' } }
  end

  def win?
    # Lines
    @board.each do |row|
      return true if row.uniq.length == 1 && row[0] != ' '
    end

    # Cols
    @board.transpose.each do |column|
      return true if column.uniq.length == 1 && column[0] != ' '
    end

    # Diagonals
    return true if [@board[0][0], @board[1][1], @board[2][2]].uniq.length == 1 && @board[0][0] != ' '
    return true if [@board[0][2], @board[1][1], @board[2][0]].uniq.length == 1 && @board[0][2] != ' '

    false
  end
end
