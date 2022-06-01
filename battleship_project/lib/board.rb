class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  attr_reader :size

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts 'you sunk my battleship!'
        true
    else
        self[pos] = :X
        false
    end
  end

  def place_random_ships
    (@size / 4).times do
        pos = [rand(0...@grid.length), rand(0...@grid.length)]
        self[pos] == :N ? self[pos] = :S : redo
    end
  end

  def hidden_ships_grid
    @grid.map { |row| row.map { |el| el == :S ? :N : el } }
  end

  def self.print_grid(grid)
    grid.each do |row|
        row.each_with_index do |el, i|
            print el
            print " " unless i == row.length - 1
        end
        puts
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
