def initialize_board
  board = {}
  (1..9).each {|position| board[position] = " " }
  board
end

def draw_board(b)
  puts "#{b[1]} |#{b[2]} |#{b[3]}"
  puts "------------- "
  puts "#{b[4]} |#{b[5]} |#{b[6]}"
  puts "------------- "
  puts "#{b[7]} |#{b[8]} |#{b[9]}"
end

def player_picks_square(b)
  begin
    puts "Pick a square (1 - 9):"
    position = gets.chomp.to_i
      if !open_squares(b).include?(position)
        puts "Oops! Try again you fool!"
      end
  end until open_squares(b).include?(position)
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
    return "Player" if b.values_at(*arr).count('X') == 3
    return "Computer" if b.values_at(*arr).count('0') == 3
  end
  nil 
end

board = initialize_board
draw_board(board)
  
begin 
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_for_winner(board)
end until winner || open_squares(board).empty?

if winner == "Player"
  puts "You win!"
elsif winner == "Computer"
 puts "You lose!"
else 
  puts "It's a tie!"
end