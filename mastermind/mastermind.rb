require './lib/game_manager'
require './lib/game_prompts'


puts "Welcome to Mastermind!"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

input = gets.chomp.downcase
game_manager = GameManager.new
game_prompts = GamePrompts.new
game_manager.secret_generator
game_start   = nil

loop do
  if input == "p" || input == "play"
    game_prompts.play_prompt
    input = gets.chomp
    game_start = Time.now
  elsif input == "i" || input == "instructions"
    game_prompts.instructions
    input = gets.chomp
  elsif input == "c" || input == "cheat"
    game_prompts.cheat_prompt(game_manager)
    input = gets.chomp
  elsif input == "q" || input == "quit"
    game_prompts.quit_prompt
    break
  else
    game_manager.guess_manager.user_input(input)
    result = game_manager.position_counter
    colors_right = game_manager.color_check
    guess_count = game_manager.guess_manager.guesses.count
    current_guess_array = game_manager.guess_compare.join.upcase
    game_manager.position_check
    if input.length > game_manager.answer.count
      game_prompts.too_many_characters_prompt(game_manager)
      input = gets.chomp
    elsif input.length < game_manager.answer.count
      game_prompts.too_few_characters_prompt(game_manager)
      input = gets.chomp
    elsif game_manager.position_counter == 4
      game_time = Time.new - game_start
      game_prompts.congrats_prompt(game_manager, game_time)
        break
    else
      game_prompts.try_again_prompt(current_guess_array, result, colors_right, guess_count)
      input = gets.chomp
    end
  end
end
