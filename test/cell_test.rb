require 'test_helper'

module GameOfLife
  class CellTest < Minitest::Test
    def setup
      @dead_cell = Cell.new
      @live_cell = Cell.new(true)
    end

    def test_can_check_cell_status
      assert @dead_cell.dead? && !@dead_cell.alive?, 'cell should correctly report as dead'
      assert @live_cell.alive? && !@live_cell.dead? , 'cell should correctly report as alive'

      assert !@dead_cell.marked_for_death? && !@dead_cell.marked_for_birth?, 'new dead cell should not be marked'
      assert !@live_cell.marked_for_death? && !@live_cell.marked_for_birth?, 'new live cell should not be marked'
    end

    def test_cell_can_be_marked_for_birth_and_born
      @dead_cell.mark_for_birth!

      assert @dead_cell.marked_for_birth?, 'cell should be marked for birth'

      @dead_cell.mutate!

      assert @dead_cell.alive?, 'cell should now be alive'
      assert !@dead_cell.marked_for_birth?, 'cell should no longer be marked'
    end

    def test_cell_can_be_marked_for_death_and_killed
      @live_cell.mark_for_death!

      assert @live_cell.marked_for_death?, 'cell should be marked for death'

      @live_cell.mutate!

      assert @live_cell.dead?, 'cell should now be dead'
      assert !@live_cell.marked_for_death?, 'cell should no longer be marked'
    end

    def test_unmarked_cell_status_does_not_change
      @dead_cell.mutate!

      assert @dead_cell.dead?, 'cell should still be dead'

      @live_cell.mutate!

      assert @live_cell.alive?, 'cell should still be alive'
    end
  end
end