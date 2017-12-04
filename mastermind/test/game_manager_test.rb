require_relative 'test_helper'
require './lib/game_manager'

class GameManagerTest < Minitest::Test

  def test_that_game_manager_class_exists
    game_manager = GameManager.new

    assert_instance_of GameManager, game_manager
  end

  def test_computer_selection_is_colors_shuffled
    game_manager = GameManager.new

    assert_equal 4, game_manager.computer_selection.count
  end

  def test_answer_is_array
    game_manager = GameManager.new

    assert_instance_of Array, game_manager.answer
  end

  def test_answer_array_has_the_colors
    game_manager = GameManager.new
    game_manager.secret_generator

    assert_equal 4, game_manager.answer.count
  end

  def test_most_recent_guess_is_last_element_of_guess_array
    game_manager = GameManager.new
    game_manager.secret_generator
    game_manager.guess_manager.user_input("ybgf")
    game_manager.guess_manager.user_input("rgby")

    assert_equal 2, game_manager.guess_manager.guesses.count
    assert_equal ["r", "g", "b", "y"], game_manager.guess_manager.guesses.last
  end

  def test_that_position_check_compares_right_elements

    game_manager = GameManager.new
    game_manager.answer << "r" << "g" << "b" << "y"
    game_manager.guess_manager.user_input("GGBR")
    game_manager.guess_manager.user_input("RRYB")

    assert_equal ["r", "r"], game_manager.compare[0]
  end

  def test_that_guess_can_be_compared_to_answer_correctly
    game_manager = GameManager.new
    game_manager.answer << "r" << "g" << "b" << "y"
    game_manager.guess_manager.user_input("rgby")
    game_manager.position_check
    game_manager.color_check

    assert_equal 4, game_manager.position_counter
    assert_equal 4, game_manager.color_correct
  end

  def test_that_a_weird_guess_can_be_compared_to_answer_correctly
    game_manager = GameManager.new
    game_manager.answer << "r" << "r" << "g" << "y"
    game_manager.guess_manager.user_input("rrrr")
    game_manager.position_check
    game_manager.color_check

    assert_equal 2, game_manager.position_counter
    assert_equal 1, game_manager.color_correct
  end

  def test_position_counter_doesnt_remain_same_after_input
    game_manager = GameManager.new
    game_manager.answer << "g" << "g" << "y" << "y"
    game_manager.guess_manager.user_input("rgyb")
    game_manager.position_check

    assert_equal 2, game_manager.position_counter

    game_manager.guess_manager.user_input("yygg")
    game_manager.position_check

    assert_equal 0, game_manager.position_counter
  end


    def test_color_counter_doesnt_remain_same_after_input
      game_manager = GameManager.new
      game_manager.answer << "r" << "g" << "y" << "b"
      game_manager.guess_manager.user_input("rgyb")
      game_manager.position_check

      assert_equal 4, game_manager.color_check

      game_manager.guess_manager.user_input("yygg")
      game_manager.position_check

      assert_equal 2, game_manager.color_check
    end
end
