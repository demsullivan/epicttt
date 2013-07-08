class Board
  VALID_MARKS = ['X', 'O']

  private
  attr_accessor :board, :board_size, :complete

  public
  def initialize(board_size=3, value='')
    @board = Array.new(board_size)
    (0...board_size).each do |y|
      @board[y] = Array.new(board_size)
      (0...board_size).each {|x| @board[y][x] = value.clone}
    end
    
    @complete = false
    @board_size = board_size
  end

  def cols
    @board.transpose
  end

  def diagonals
    ret = []
    # top-left to bottom-right
    x, y = 0, 0
    item = []
    while y < @board_size
      item << @board[x][y]
      x += 1
      y += 1
    end
    ret << item

    # top-right to bottom-left
    x, y = 2, 0
    item = []
    while y < @board_size
      item << @board[x][y]
      x -= 1
      y += 1
    end
    ret << item
    ret
  end
  
  
  def has_winner?
    # check horizontals
    winner = false
    prev = nil
    [@board, cols, diagonals].each do |layout|
      layout.each do |row|
        prev = nil
        row.each do |box|
          winner = (prev == box and not box.nil?)
          prev = box
        end
        break if winner
      end
      break if winner
    end
    winner
  end

  def set_mark!(x, y, mark)
    raise "Coordinates out of bounds!" unless x < @board_size and y < @board_size
    raise "Invalid mark type!" unless VALID_MARKS.include? mark or mark.kind_of?(Board)

    @board[y][x] = mark
  end

  def get_mark(x, y)
    raise "Coordinates out of bounds!" unless x < @board_size and y < @board_size
    @board[y][x]
  end


end

      
