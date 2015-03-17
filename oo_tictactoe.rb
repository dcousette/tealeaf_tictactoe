# Tictactoe is played with 1 game board that is 3 squares X 3 squares. There are two players.
# Each player takes a turn marking a square on the board with an "X" or an "O".
# The "X" player starts the game. The first player to mark three squares in a row wins. 
# If all squares are taken and no winner - then its a tie game. 

class Board
  
  WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  attr_accessor :data
  
  def initialize
    @data = {}
    (1..9).map {|position| @data[position] = Square.new(" ")}
  end 

  def draw_board
    puts "#{@data[1].value} |#{@data[2].value} |#{@data[3].value}"
    puts "------------- "
    puts "#{@data[4].value} |#{@data[5].value} |#{@data[6].value}"
    puts "------------- "
    puts "#{@data[7].value} |#{@data[8].value} |#{@data[9].value}"
  end   
  
  def empty_squares
    data.select {|_, square| square.value == " "}.values  
  end 
     
  def empty_positions
    data.select {|_, square| square.value == " "}.keys 
  end
  
  def all_spaces_taken?
    true if empty_squares.count == 0
  end
  
  def mark_square(position, marker)
    @data[position].value = marker
  end
  
  def winning_conditions?(marker)
    WINNING_LINES.each do |line|
      return true if (@data[line[0]].value == marker) && (@data[line[1]].value == marker) && (@data[line[2]].value == marker)
    end
    false 
  end 
end

class Player
  attr_accessor :name, :marker 
  
  def initialize(name, marker)
    self.name = name
    self.marker = marker 
  end 
end 

class Square
  attr_accessor :value
  
  def initialize(value)
    self.value = value 
  end 
  
  def occupied?
    true if value != " "
  end
  
  def mark(marker)
    self.value = marker 
  end 
end

class Game
  def initialize 
    @board = Board.new
    @player = Player.new("DeShawn", "X")
    @computer = Player.new("Johnny5", "0")
    @current_player = @player
  end 

  def current_player_marks_square
    if @current_player == @player 
      begin 
      puts "Choose a position (1-9):"
      position = gets.chomp.to_i
      end until @board.empty_positions.include?(position)
    else   
      position = @board.empty_positions.sample
    end
    @board.mark_square(position, @current_player.marker)
  end 
  
  def alternate_current_player 
    if @current_player == @player
      @current_player = @computer
    else 
      @current_player = @player
    end
  end 
  
  def current_player_wins?
    @board.winning_conditions?(@current_player.marker)
  end 
  
  def play
    @board.draw_board
    loop do 
      current_player_marks_square
      system "clear"
      @board.draw_board
      if current_player_wins?
        puts "The winner is: #{@current_player.name}!"
        break
      elsif @board.all_spaces_taken?
        puts "It's a tie..."
        break
      else 
        alternate_current_player
      end 
    end 
    puts "Bye!"
  end 
end 

new_game = Game.new 
new_game.play 