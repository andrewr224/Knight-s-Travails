class Board

  def initialize
    @squares = [[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]]]
  end

  def squares
    @squares
  end
end

class Knight

  def initialize(col, row)
    @position = [col, row]

  end

  def position
    @position
  end

  def move(col, row)
    return "Please provide valid input" unless ((col.is_a? Integer) && (col >= 0) && (col < 8))
    return "Please provide valid input" unless ((row.is_a? Integer) && (row >= 0) && (row < 8))

    current_col = @position[0]
    current_row = @position[1]

    if ((current_col - col).abs == 1 && (current_row - row).abs == 2) || ((current_col - col).abs == 2 && (current_row - row).abs == 1)
      @position = [col, row]
      "Moved to a new square"
    else
      "Target is out of reach"
    end
  end
end
