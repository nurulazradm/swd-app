class Board
  attr_accessor :board_fields, :empty_fields, :winning_lines

  def initialize(size=3)
    @size = size
    @board_fields = {}
    @empty_fields = []
    @winning_lines = []

    set_board
  end

  def fill_field(position, mark)
    @board_fields[position] = "#{mark}"
    @empty_fields.delete(position)
  end

  def set_board_fields
    (1..@size**2).each {|p| @board_fields[p] = " "; @empty_fields << p}
  end

  def set_winning_lines
    # create for column
    columns = []
    (1..@size).each do |line|
      columns[line] = []
      (0...@size).each {|key| columns[line] << @size*key + line}
      @winning_lines << columns[line]
    end

    # create for row
    rows = []
    (0...@size).each do |line|
      rows[line] = []
      (1..@size).each {|key| rows[line] << line*@size + key}
      @winning_lines << rows[line]
    end

    # create for diagonal
    diagonals = []
    diagonals[1] = []
    diagonals[2] = []
    (0...@size).each do |key|
      diagonals[1] << @size*key + (key+1)
      diagonals[2] << @size*key + (@size-key)
    end
    @winning_lines << diagonals[1]
    @winning_lines << diagonals[2]
  end

  def set_board
    set_board_fields
    set_winning_lines
  end
end
