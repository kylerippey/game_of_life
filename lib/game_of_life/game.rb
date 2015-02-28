module GameOfLife
  class Game
    attr_reader :board, :days_elapsed

    def initialize(options={})
      input = options[:board] || generate_random_board(options)
      @board = Board.new(input)
      @days_elapsed = 0
    end

    def tick!
      @board.tick!
      @days_elapsed += 1
    end

    private

    def generate_random_board(options={})
      width = options.fetch(:width) {100}
      height = options.fetch(:height) {100}
      result = []

      height.times do
        new_row = []
        width.times do
          new_row << rand(2)
        end
        result << new_row
      end

      result
    end
  end
end