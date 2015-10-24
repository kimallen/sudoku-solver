class Sudoku
  def initialize(board_string)
    #@board_string = board_string.split("")
    @board_string = board_string
  end

  def board_convert
    @board_array = @board_string.split("").map(&:to_i)
  end

  def empty_cell_array
    @empty_cell_indices = []
   # @board_string.map! { |item| item.to_i }
   # @board_string.each_with_index { |item, index| empty_cell_indices << index if item.zero? }
   @board_array.each_with_index { |item, index| @empty_cell_indices << index if item.zero? }
     @empty_cell_indices
  end


  def solve
  end

  def board
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end


#####DRIVER CODE#########
game = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
game.board_convert
game.empty_cell


# KIMS CODE
board_string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

class Sudoku
  def initialize(board_string)
    @board_string = board_string
  end


  def board_convert
    @board_array = @board_string.split("").map(&:to_i)
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

  def board

  end

  def empty_cell_array
    board_convert
    @empty_cell_indices= []
    @board_array.each_with_index do |e, i|
      @empty_cell_indices<< i if e == 0
    end
    p @empty_cell_indices
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
        check_numbers
        if @answer.length==1
          @board_array[empty_cell] = @answer[0]
        end
      end
    end
    @board_array
  end
  # Returns a string representing the current state of the board
  def to_s
  end
end

sudoku = Sudoku.new(board_string)
sudoku.board_convert
sudoku.row_array(4)
sudoku.column_array(4)
sudoku.box_array(4)
sudoku.empty_cell_array
p sudoku.solve

# KAIS CODE
require 'pp'
class Sudoku
  def initialize(board_string)
  end

  def solve

  end

  def board
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end



def check_numbers
  existing_numbers=@row_array+@column_array+@box_array
  existing_numbers.uniq!
  possible_answers = [1,2,3,4,5,6,7,8,9]
  @answer=possible_answers-existing_numbers
end
