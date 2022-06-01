require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end
    
    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        puts "There are #{@board.size / 4} hidden ships on the board"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            true
        else
            false
        end
    end

    def game_over?
        win? || lose?
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 unless @board.attack(move)
        @board.print
        print @remaining_misses
        puts " remaining misses"
    end
end
