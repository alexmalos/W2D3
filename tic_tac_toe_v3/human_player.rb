class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position(positions)
        puts "Player #{mark}, enter a position as two numbers with a space between them: "
        pos = gets.chomp.split.map!(&:to_i)
        until positions.include?(pos)
            puts "Invalid position. Please enter a position as two numbers with a space between them: "
            pos = gets.chomp.split.map!(&:to_i)
        end
        pos
    end
end
