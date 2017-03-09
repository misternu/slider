require_relative 'spec_helper'

describe View do
  let(:view) { View.new }
  let(:state) { [1,2,3,4,5,6,7,8,nil] }
  let(:prompt) { "Which tile would you like to move?\n" }
  describe '#board_to_string' do
    it 'returns a decorated string' do
      expected = <<~EXPECTED
          [1][2][3]
          [4][5][6]
          [7][8][ ]
        EXPECTED
        .chomp
      expect(view.board_to_string(state)).to eq expected
    end
  end
  describe '#prompt_user' do
    before(:example) do
      expect(view).to receive(:gets)
      .and_return('8')
    end
    it 'prints the standard prompt' do
      expect{view.prompt_user}.to output(prompt).to_stdout
    end
    it 'retrieves the user input' do
      allow(STDOUT).to receive(:puts)
      expect(view.prompt_user).to eq "8"
    end
    it 'can use a custom prompt' do
      expect{view.prompt_user("foo")}.to output("foo\n").to_stdout
    end
  end
end
