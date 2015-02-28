module GameOfLife
  class Cell
    def initialize(alive=false)
      @alive = alive
    end

    def alive?
      alive
    end

    def dead?
      !alive
    end

    def mark_for_death!
      @mark = :death unless dead?
    end

    def marked_for_death?
      mark == :death
    end

    def mark_for_birth!
      @mark = :birth unless alive?
    end

    def marked_for_birth?
      mark == :birth
    end

    def mutate!
      return unless marked?

      case mark
      when :birth
        @alive = true
      when :death
        @alive = false
      else
        raise "marked for unknown mutation: #{mark.to_s}"
      end

      unmark!
    end

    def marked?
      mark != nil
    end

    private

    def unmark!
      @mark = nil
    end

    attr_reader :alive, :mark
  end
end