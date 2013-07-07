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
  def initialize(board_size)
    @board = [['']*board_size]*board_size]

    @complete = false
  end

  def has_winner?
    # check horizontals
    winner = false
    prev = ''
    @board.each do |row|
      row.each do |box|
        prev = box if prev == ''
        winner = (box == prev)
      end
      break if winner
    end
    winner
  end

  def set_mark(x, y, mark)
    if x > @board[0].length or y > @board.length
      raise Exception
    end
    
end

      
