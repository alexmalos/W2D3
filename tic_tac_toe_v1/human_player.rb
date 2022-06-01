class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position
        puts "Player #{mark}, enter a position as two numbers with a space between them: "
        pos = gets.chomp.split

        if pos.length != 2
            raise RuntimeError.new "You should enter exactly two numbers"
        elsif pos.any? { |i| i.to_i.to_s != i }
            raise RuntimeError.new "You should only enter numbers"
        else
            pos.map!(&:to_i)
        end
    end
end