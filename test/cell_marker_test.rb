require 'test_helper'

module GameOfLife
  class CellMarkerTest < Minitest::Test

    def test_cell_is_born_with_three_neighbors
      board = Board.new([
        [1,0,0],
        [1,0,1],
        [0,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert board.at(1,1).marked_for_birth?, 'cell should be marked for birth'
    end

    def test_cell_is_not_born_with_two_neighbors
      board = Board.new([
        [0,0,0],
        [1,0,1],
        [0,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert !board.at(1,1).marked?, 'cell should not be marked'
    end

    def test_cell_is_not_born_with_four_neighbors
      board = Board.new([
        [1,0,1],
        [1,0,0],
        [0,0,1],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert !board.at(1,1).marked?, 'cell should not be marked'
    end

    def test_cell_stays_alive_with_two_neighbors
      board = Board.new([
        [0,0,0],
        [1,1,1],
        [0,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert !board.at(1,1).marked?, 'cell should not be marked'
    end

    def test_cell_stays_alive_with_three_neighbors
      board = Board.new([
        [1,0,0],
        [1,1,0],
        [1,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert !board.at(1,1).marked?, 'cell should not be marked'
    end

    def test_cell_dies_from_overcrowding
      board = Board.new([
        [1,1,1],
        [1,1,0],
        [0,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert board.at(1,1).marked_for_death?, 'cell should be marked for death'
    end

    def test_cell_dies_from_loneliness
      board = Board.new([
        [0,0,1],
        [0,1,0],
        [0,0,0],
      ])

      CellMarker.new(board, 1, 1).mark!

      assert board.at(1,1).marked_for_death?, 'cell should be marked for death'
    end


  end
end