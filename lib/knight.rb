class Knight
  attr_reader :position

  def initialize(position=[0,0])
    @position = position
  end

  def move(target)
    col = target[0]
    row = target[1]
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

  # calculates a path to the target sqaure
  def self.knight_moves(start, finish)
    start_point = Move.new(start)
    queue = [start_point]
    found = false
    answer = []

    until found
      move = queue.shift
      if move.position == finish
        answer.unshift move.position
        found = true
        until move.parent.nil?
          move = move.parent
          answer.unshift move.position
        end
      end

      move.possible_moves.each do |m|
        queue << Move.new(m, move)
      end
    end
    answer
  end

  class Move
    attr_accessor :parent
    attr_reader :position
    def initialize(position, parent=nil)
      @position = position
      @parent = parent
    end

    def possible_moves
      col = @position[0]
      row = @position[1]

      moves = []

      moves << [col - 2, row - 1] if (0..7).include?(col - 2) && (0..7).include?(row - 1)
      moves << [col - 2, row + 1] if (0..7).include?(col - 2) && (0..7).include?(row + 1)
      moves << [col + 2, row - 1] if (0..7).include?(col + 2) && (0..7).include?(row - 1)
      moves << [col + 2, row + 1] if (0..7).include?(col + 2) && (0..7).include?(row + 1)
      moves << [col - 1, row - 2] if (0..7).include?(col - 1) && (0..7).include?(row - 2)
      moves << [col - 1, row + 2] if (0..7).include?(col - 1) && (0..7).include?(row + 2)
      moves << [col + 1, row - 2] if (0..7).include?(col + 1) && (0..7).include?(row - 2)
      moves << [col + 1, row + 2] if (0..7).include?(col + 1) && (0..7).include?(row + 2)

      moves
    end
  end
end
