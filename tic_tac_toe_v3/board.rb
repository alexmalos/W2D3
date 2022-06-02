class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
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
        diagonals = [@grid, @grid.reverse].map do |grid|
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

    def legal_positions
        @grid.each_with_index.inject([]) do |acc, (row, i1)|
            row.each_with_index do |el, i2|
                acc << [i1, i2] if el == '_'
            end
            acc
        end
    end
end
