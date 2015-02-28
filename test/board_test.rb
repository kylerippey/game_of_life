require 'test_helper'

module GameOfLife
  class BoardTest < Minitest::Test
    def setup
      @example = [
        [0,0,0],
        [0,1,0],
        [0,0,0],
      ]

      @board = Board.new(@example)
    end

    def test_can_iterate_over_cells
      assert @board.cells.is_a?(Enumerable)
    end
  end
end