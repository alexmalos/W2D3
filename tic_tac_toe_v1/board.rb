class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(pos)
        pos.all? { |i| i < @grid.length && i >= 0 }
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == '_'
    end

    def place_mark(pos, mark)
        if !valid?(pos)
            raise ArgumentError.new "Invalid position"
        elsif !empty?(pos)
            raise RuntimeError.new "Position is already marked"
        else
            @grid[pos[0]][pos[1]] = mark
        end
    end

    def print_board
        @grid.each do |row|
            row.each { |el| print el.to_s + " " }
            puts
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        diagonals = [@grid, @grid.reverse].collect do |grid|
            grid.each_with_index.inject([]) { |diagonal, (row, i)| diagonal << row[i] }
        end
        diagonals.any? { |diagonal| diagonal.all?(mark) }
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any?('_')
    end
end