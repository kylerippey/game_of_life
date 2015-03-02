$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'game_of_life'
require 'gosu'

class GameOfLifeGui < Gosu::Window
  SCALE_FACTOR = 5
  DEAD_COLOR = 0xff000000
  ALIVE_COLOR = 0xff0000ff

  attr_reader :game

  def initialize(width=800, height=600, fullscreen=false)
    super

    self.caption = "Game of Life"

    @game = GameOfLife::Game.new(width: width / SCALE_FACTOR, height: height / SCALE_FACTOR)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def update
    @game.tick!
  end

  def draw
    @game.board.cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        color = (cell.alive? ? ALIVE_COLOR : DEAD_COLOR)
        scale(SCALE_FACTOR) do
          draw_quad(
            x, y, color,
            x+1, y, color,
            x+1, y+1, color,
            x, y+1, color
          )
        end
      end
    end
  end
end

GameOfLifeGui.new.show