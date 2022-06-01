class Player
    def get_move
        print "enter a position: "
        pos = gets.chomp.split
        [pos[0].to_i, pos[1].to_i]
    end
end
