module GameOfLife
  class CellMarker
    attr_reader :board, :x, :y

    def initialize(board, x, y)
      @board = board
      @x = x
      @y = y
    end

    def mark!
      # Rule 1: A dead cell with exactly three live neighbors becomes a live cell (birth).
      cell.mark_for_birth! if alive_neighbors == 3

      # Rule 2: A live cell with two or three live neighbors stays alive (survival).
      # Rule 3: In all other cases, a cell dies or remains dead (overcrowding or loneliness).
      cell.mark_for_death! unless alive_neighbors == 2 || alive_neighbors == 3
    end

    private

    def cell
      board.at(x, y)
    end

    def alive_neighbors
      neighbors.compact.select(&:alive?).length
    end

    def neighbors
      @neighbors ||= begin
        n = []
        # Top row
        n << board.at(x-1, y-1)
        n << board.at(x, y-1)
        n << board.at(x+1, y-1)

        # Left
        n << board.at(x-1, y)

        # Right
        n << board.at(x+1, y)

        # Bottom row
        n << board.at(x-1, y+1)
        n << board.at(x, y+1)
        n << board.at(x+1, y+1)
        n
      end
    end
  end
end