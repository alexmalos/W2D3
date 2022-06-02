require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(n, player_hash)
        @board = Board.new(n)
        @players = player_hash.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print_board
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
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
