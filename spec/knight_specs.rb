require 'knight'

RSpec.describe "Knight" do
  let(:knight) { Knight.new }

  it "has an initial position" do
    expect(knight.position).to_not be_nil
  end

  describe '#move' do
    it "needs valid input" do
      expect(knight.move([-1,'and'])).to eq("Please provide valid input")
    end

    it "can't move to a square that isn't within his range" do
      expect(knight.move([7,7])).to eq("Target is out of reach")
    end

    it "can move to a square that is within his range" do
      expect(knight.move([1,2])).to eq("Moved to a new square")
    end

    context "when moves to a new square" do
      it "has a position that of the square he moved to" do
        knight.move([1,2])
        expect(knight.position).to eq([1,2])
      end
    end
  end

  describe '.knight_moves' do
    let(:path) { Knight.knight_moves([0,0],[6,7]) }
    it "calculates the shortes way to the target" do
      expect(Knight.knight_moves([0,0],[1,2])).to eq([[0,0],[1,2]])
      expect(Knight.knight_moves([0,0],[3,3])).to eq([[0,0],[2,1],[3,3]])
      expect(Knight.knight_moves([1,2],[6,7])).to_not be_empty
    end

    it "can then move to the target square [6,7]" do
      path.each do |step|
        knight.move(step)
      end
      expect(knight.position).to eq([6,7])
    end
  end
end
