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