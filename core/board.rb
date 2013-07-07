class Board
  # horizontal
  # (0,0, 0,1, 0,2)
  # (1,0, 1,1, 1,2)
  # (2,0, 2,1, 2,2)
  # vertical
  # (0,0, 1,0, 2,0)
  # (
  # (0,0, 1,1, 2,2)
  #
  VALID_MARKS = ['X', 'O']
  protected
  def check_winner(prev, box)
    prev = box if prev == ''
    winner = (box == prev and box != '')
    return winner
  end
  
  public
  def initialize(board_size=3)
    @board = []
    x = 0
    while x < board_size
      row, y = [], 0
      while y < board_size
        row << ''
        y += 1
      end
      @board << row
      x += 1
    end
    
    @complete = false
  end

  def has_winner?
    # check horizontals
    winner = false
    @board.each do |row|
      prev = ''
      row.each do |box|
        winner = check_winner(prev, box)
      end
      break if winner
    end
    return winner if winner

    # check verticals
    x, = 0
    while x <= @board.length
      prev = ''
      y = 0
      while y <= @board[x].length
        box = @board[x][y]
        winner = check_winner(prev, box)
        y += 1
      end
      break if winner
      x += 1
    end
    return winner if winner
        
  end

  def set_mark!(x, y, mark)
    if x > @board[0].length or y > @board.length
      raise Exception
    end

    unless VALID_MARKS.include? mark
      raise Exception
    end
    @board[x][y] = mark
  end

  def get_mark(x, y)
    if x > @board[0].length or y > @board.length
      raise Exception
    end
    @board[x][y]
  end
end

      
