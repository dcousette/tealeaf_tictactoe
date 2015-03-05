require 'pry' 

#  Program dev process
#1 Determine the requirements or specifications for the program. This determines scope.
#2 Figure out the application logic. What is the sequence of steps req in the program?
#3 Translating application logic to ruby code. 
#4 Run code making sure logic works. 

# what do i need?
# 1. a game board
# 2. players (x and o)
# 3. functionality 

# how does it work?
# draw a board 
# assign player 1 to 'x'
# assign player 2 to 'o'

# loop until there is a winner or all squares taken
#   player 1 picks an empty square
#   check for winner 
#   player 2 picks an empty square
#   check for winner 
# 

# if there is winner
#   show winnner
# elsif board is full 
#   its a tie 
  
# ask to replay?

board = {}

def initialize_board(b)
  (1..9).each {|position| b[position] = " " }
  b 
end

def draw_board(b)
  puts "#{b[1]} |#{b[2]} |#{b[3]}"
  puts "------------- "
  puts "#{b[4]} |#{b[5]} |#{b[6]}"
  puts "------------- "
  puts "#{b[7]} |#{b[8]} |#{b[9]}"
end

def player_picks_square(b)
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
    until open_squares(b).include?(position)
      puts "That space is taken fool!"
      position = get.chomp.to_i
    end
  b[position] = "X"
end 

def computer_picks_square(b)
 position = open_squares(b).sample
 b[position] = "O"
end 

def open_squares(b)
  b.select {|k, v| v == " "}.keys 
end 

def check_for_winner(b) 
  winning_positions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  
  winning_positions.each do |arr| 
    if b[arr[0]] == "X" and b[arr[1]] == "X" and b[arr[2]] == "X"   
      return "Player"
    elsif b[arr[0]] == "O" and b[arr[1]] == "O" and b[arr[2]] == "O" 
      return "Computer"
    else 
      return nil
    end
    binding.pry
  end  
end
  #list all possible winning combinations
  #test board to see if any of the winning combinations has been met
    #iterate thru board
    #check hash values for each set of winning positions
    #
  #if a winning combo has been met - return a winner variable
    

initialize_board(board)
draw_board(board)
  
begin 
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  check_for_winner(board)
  
end until winner || open_squares(board).empty?


