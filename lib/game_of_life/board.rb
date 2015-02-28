module GameOfLife
  class Board
    attr_reader :cells

    def initialize(input)
      load(Array(input))
    end

    def width
      return 0 unless cells.first.is_a?(Array)

      cells.first.length
    end

    def height
      cells.length
    end

    def at(x, y)
      return nil if x < 0 || x >= width
      return nil if y < 0 || y >= height

      cells[y][x]
    end

    def tick!
      cells.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          CellMarker.new(self, x, y).mark!
        end
      end

      cells.flatten.each(&:mutate!)
    end

    def to_a
      output = []

      cells.each do |row|
        new_row = []
        row.each do |cell|
          new_row << (cell.alive? ? 1 : 0)
        end
        output << new_row
      end

      output
    end

    private

    def load(input)
      @cells = []
      input.each do |row|
        new_row = []
        row.each do |val|
          new_row << Cell.new(val == 1)
        end
        @cells << new_row
      end
    end
  end
end