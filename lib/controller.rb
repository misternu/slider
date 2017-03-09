class Controller
  attr_accessor :view, :model
  def initialize(view = View.new)
    @view = view
    @model = Model.new
    @model.scramble
  end

  def play
    display_board
    until self.model.solved
      did_move = false
      input = self.view.prompt_user
      did_move = self.model.move_by_name(input)
      until did_move
        input = self.view.re_prompt.to_i
        did_move = self.model.move_by_name(input)
      end
      display_board
    end
  end

  def display_board
    self.view.display(self.model.state)
  end

  def valid(input)
    ("1".."8").include?(input)
  end
end
