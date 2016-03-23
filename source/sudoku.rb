require 'pp'

class Sudoku
  def initialize(board_string)
    @board_string = board_string
  end

  def board_convert
    @board_array = @board_string.split("").map(&:to_i)
  end

  def empty_cell_array
    @empty_cell_indices = []
   @board_array.each_with_index { |item, index| @empty_cell_indices << index if item.zero? }
     @empty_cell_indices
  end

  def row_array(index)
    @row_array = []
    @column_name= index % 9
    @row_name = index/9
    @base_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @base_array.map do |base|
       @row_array<<@board_array[9*@row_name + base]
    end
    @row_array
  end

  def column_array(index)
      @column_array = []
      @column_name= index % 9
      @row_name = index/9
      @base_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      @base_array.map do |base|
        @column_array<<@board_array[9*base + @column_name]
      end
      @column_array
  end

  def box_array(index)
      @box_array = []
      @column_name= index % 9
      @row_name = index/9
      box_column = @column_name - @column_name%3
      box_row = @row_name - @row_name%3
      box_pos = 9*box_row + box_column

      [box_pos, box_pos+1, box_pos+2].map do |base|
        @box_array<<@board_array[base]
        @box_array<<@board_array[base + 9]
        @box_array<<@board_array[base + 18]
      end
      @box_array
  end

def unused_numbers
  existing_numbers=@row_array+@column_array+@box_array
  existing_numbers.uniq!
  possible_answers = [1,2,3,4,5,6,7,8,9]
  @answer=possible_answers-existing_numbers
end

  def solve
    board_convert
    empty_cell_array
    #until there's no more zeros in board
    until @board_array.include?(0) == false
      #checks all of the empty cells and fills it if it can
      @empty_cell_indices.map do |empty_cell|
        row_array(empty_cell)
        column_array(empty_cell)
        box_array(empty_cell)
        unused_numbers
        if @answer.length==1
          @board_array[empty_cell] = @answer[0]
        end
      end
    end
    @board_array
  end

  def board
  end

  # Returns a string representing the current state of the board
  def to_s
    @board_array = @board_array.map(&:to_s)
    pp @board_array.each_slice(9).to_a
  end


end


#####DRIVER CODE#########
puts "Game 1"

board_string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s

puts "Game 2"
board_string = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s

puts "Game 3"
board_string = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s

puts "Game 4"
board_string = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"
game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s

puts "Game 5"
board_string = "6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--"
game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s

#expect not to work#
puts "Game 6"
board_string = "---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----"
game = Sudoku.new(board_string)
game.board_convert
game.empty_cell_array
game.solve
game.to_s





