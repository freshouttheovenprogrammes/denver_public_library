class GuessManager
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def user_input(input)
    @guesses << input.downcase.split("")
      if input.length != 4
        guesses.pop
      end
  end
end
