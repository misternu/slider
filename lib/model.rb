class Model
  SOLVED_BOARD = [1,2,3,4,5,6,7,8,nil]

  attr_reader :state
  def initialize
    @state = SOLVED_BOARD.dup
  end

  def scramble
    1000.times do
      place = neighbors.sample
      move(place)
    end
  end

  def hole_index
    self.state.index(nil)
  end

  def move_by_name(string)
    i = self.state.index(string.to_i)
    move(i)
  end

  def move(tile)
    return false unless neighbors.include?(tile)
    tile1 = hole_index
    self.state[tile1], self.state[tile] = self.state[tile], self.state[tile1]
    true
  end

  def solved
    self.state == SOLVED_BOARD
  end

  def neighbors
    result = []
    i = self.state.index(nil)
    result << i - 3 if i / 3 > 0
    result << i + 3 if i / 3 < 2
    result << i - 1 if i % 3 > 0
    result << i + 1 if i % 3 < 2
    result
  end
end
