require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark1, mark2)
        @board = Board.new
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print_board
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Congratulations, you win!"
                return
            else
                switch_turn
            end
        end
        puts "Draw"
    end
end