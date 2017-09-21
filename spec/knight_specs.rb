require 'knight'

# is a game
#
# has a board
# board's dimentions are 8x8
# board has 64 squares
# board has 32 black squares
# board has 32 white squares
# a square can be empty
# a square can be occupied
#
# has figures
# has a knight
# knight is a figure
# knight has a position
# a knight moves 1 square forward and 2 to the side, in any direction
# can find a route
# can find the shortest route



RSpec.describe "Board" do
  let(:game) { Board.new }

  it "is a game" do
    expect(game).to be_truthy
  end

  describe '#squares' do
    it "has squares" do
      expect(game.squares).to be_truthy
    end

    it "has 8 'rows'" do
      expect(game.squares.length).to eq(8)
    end

    it "has 8 'columns'" do
      expect(game.squares[0].length).to eq(8)
    end

    context "when square is empty" do
      it { expect(game.squares[0][0]).to be_empty }
    end

    # not yet
    #context "when square is not empty" do
    #  let(:knight) { Knight.new(0,0) }
    #  it "has a figure on it" do
    #    expect(game.squares[0][0]).to eq(knight)
    #  end
    #end
  end
end

RSpec.describe "Knight" do
  let(:game) { Board.new }
  let(:knight) { Knight.new(0,0) }

  it "has an initial position" do
    expect(knight.position).to_not be_nil
  end

  describe '#move' do
    it "needs valid input" do
      expect(knight.move(-1,'and')).to eq("Please provide valid input")
    end

    it "can't move to a square that isn't within his range" do
      expect(knight.move(7,7)).to eq("Target is out of reach")
    end

    it "can move to a square that is within his range" do
      expect(knight.move(1,2)).to eq("Moved to a new square")
    end

    context "when moves to a new square" do
      it "has a position that of the square he moved to" do
        knight.move(1,2)
        expect(knight.position).to eq([1,2])
      end
    end
  end
end
