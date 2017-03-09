require_relative 'spec_helper'

describe Model do
  let(:model) { Model.new }
  describe '#new' do
    it 'has an initial state of a solved board' do
      expect(model.state).to eq [1,2,3,4,5,6,7,8,nil]
    end
  end
  describe '#scramble' do
    it 'changes the state of the board' do
      expect{ model.scramble }.to change{ model.state }
    end
    it 'has all of the same elements' do
      previous_state = model.state.dup
      model.scramble
      expect(model.state).to include(*previous_state)
    end
  end
  describe '#hole_index' do
    it 'returns the index of the hole' do
      expect(model.hole_index).to be 8
    end
  end
  describe '#move' do
    it 'returns false if the move is impossible' do
      expect(model.move(1)).to be false
    end
    it 'moves the board if the move is possible' do
      expect(model.move(7)).not_to be false
      expect(model.state[8]).to be 8
      expect(model.state[7]).to be nil
    end
  end
  describe '#solved' do
    it 'returns true if the board is solved' do
      expect(model.solved).to be true
    end
    it 'returns false if the board is not solved' do
      expect{model.move(7)}.to change{model.solved}.from(true).to(false)
    end
  end
  describe '#neighbors' do
    it 'returns the neighbor indexes of the hole' do
      expect(model.neighbors).to include(5,7)
      model.move(7)
      expect(model.neighbors).to include(4,6,8)
      model.move(4)
      expect(model.neighbors).to include(1,3,5,7)
    end
  end
end
