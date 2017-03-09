class View
  def clear_view
    print "\e[2J"
    print "\e[H"
  end

  def display(board)
    clear_view
    puts board_to_string(board)
  end

  def board_to_string(board)
    board.map { |n| "[#{n || ' '}]" }
    .each_slice(3).map { |row| row.join('') }
    .join("\n")
  end

  def prompt_user(prompt = "Which tile would you like to move?")
    puts prompt
    gets.chomp
  end

  def re_prompt
    prompt_user("That is not a valid move--Please try again!")
  end
end
