require './lib/game_manager'
require 'time'

class GamePrompts

  def play_prompt
    puts "-------------------------------------------------------------------"
    print "I have generated a sequence with four elements made up of: (r)ed, "
    puts "(g)reen, (b)lue, and (y)ellow."
    puts  "Use (q)uit at any time to end the game."
    puts "Use (c) or (cheat) to be a cheater."
    puts "What's your guess?"

  end

  def try_again_prompt(current_guess_array, result, colors_right, guess_count)
    puts "-------------------------------------------------------------------"
    print "#{current_guess_array} has #{colors_right} of the correct elements"
    puts " with #{result} in the correct position(s)"
    puts "You're on guess #{guess_count} "
    puts "Try again!"
    print "Whats your guess?, You can choose elements (r)ed, (g)reen, (b)lue, "
    puts "and (y)ellow"
  end

  def too_many_characters_prompt(game_manager)
    puts "-------------------------------------------------------------------"
    print "Entry has too many colors. Just enter #{game_manager.answer.count}"
    puts " colors"
  end

  def too_few_characters_prompt(game_manager)
    puts "-------------------------------------------------------------------"
    print "Entry has too few colors. Please enter #{game_manager.answer.count}"
    puts  " colors"
  end

  def cheat_prompt(game_manager)
    puts "-------------------------------------------------------------------"
    puts "Alright ya cheater...the code is #{game_manager.answer.join.upcase}"
    puts "Enter 'p' to continue or just enter the code and get this over with"
  end

  def congrats_prompt(game_manager, game_time)
    time_clean = game_time.round(0)
    puts "-------------------------------------------------------------------"
    print "Congratulations! You guessed the sequence "
    print "#{game_manager.answer.join.upcase} in "
    print "#{game_manager.guess_manager.guesses.count} guesses over "
    print "#{time_clean / 60} minutes and "
    puts "#{time_clean % 60} seconds"
  end

  def instructions
    puts "-------------------------------------------------------------------"
    puts"- The computer picks a sequence of colors. There are 4 colors in this sequence. There can be multiple instances of the same color.

    - The objective of the game is to guess the exact positions of the colors in the computer's sequence.

    - After filling a line with your guesses simply press enter to see your results

    - For each color in your guess that is in the correct color and correct position in the code sequence, the display will notify you of correct colors in the sequence, as well as colors in the correct position

    - For each color in your guess that is a color that matches what is in the code sequence you will receive a color correct notification. If the answer is RRRR and you guess RRRY, color correct returns 1.

    - You win the game when you manage to guess all the colors in the code sequence and when they all in the right position.

    - You can enter (c) or (cheat) to be a filthy cheater at any time"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def quit_prompt
    puts "-------------------------------------------------------------------"
    puts "Goodbye! Thanks for playing!"
  end
end
