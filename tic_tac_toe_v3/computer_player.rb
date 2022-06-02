class ComputerPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position(positions)
        pos = positions.sample
        puts "Computer #{@mark} chose position #{pos}"
        pos
    end
end
