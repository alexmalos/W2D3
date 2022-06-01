class Player
    def get_move
        print "enter a position: "
        pos = gets.chomp.split
        pos.map(&:to_i)
    end
end
