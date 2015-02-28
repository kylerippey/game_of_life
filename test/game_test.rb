require 'test_helper'

module GameOfLife
  class GameTest < Minitest::Test
    def setup
      @game = Game.new
    end

    def test_can_access_game_time
      assert_equal 0, @game.days_elapsed
    end

    def test_can_advance_game_time
      @game.tick!

      assert_equal 1, @game.days_elapsed
    end

    def test_game_progresses_as_expected
      t0 = [
        [0,1,1,0,0,0,0],
        [0,1,1,0,0,0,0],
        [0,0,0,0,1,1,0],
        [0,0,0,0,1,1,0],
      ]

      t1 = [
        [0,1,1,0,0,0,0],
        [0,1,1,1,0,0,0],
        [0,0,0,1,1,1,0],
        [0,0,0,0,1,1,0],
      ]

      t2 = [
        [0,1,0,1,0,0,0],
        [0,1,0,0,0,0,0],
        [0,0,0,0,0,1,0],
        [0,0,0,1,0,1,0],
      ]

      t3 = [
        [0,0,1,0,0,0,0],
        [0,0,1,0,0,0,0],
        [0,0,0,0,1,0,0],
        [0,0,0,0,1,0,0],
      ]

      @game = Game.new(board: t0)

      @game.tick!
      assert_equal t1, @game.board.to_a

      @game.tick!
      assert_equal t2, @game.board.to_a

      @game.tick!
      assert_equal t3, @game.board.to_a
    end
  end
end