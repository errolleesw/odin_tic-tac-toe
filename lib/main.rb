class Player
  attr_reader :name
  attr_reader :symbol
  
  def initialize (name,symbol)
    @name = name
    @symbol = symbol
  end

end

  
def print_board(board)
  puts "" # insert a gap before previous line in console
  board.each_with_index do |row, i|
    # Print the row
    puts row.join(' | ')
    # Print the horizontal separator
    puts '-' * 9 if i < 2
  end
  puts "" # insert a gap 
end

board = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

board_draw = [
  ["X", "O", "O"],
  ["O", "X", "X"],
  ["O", "X", "O"]
]

def player_turn(position,board,symbol)
  if position.between?(1,9)
    # puts "true"
    board.each_with_index do |sub_arr, i|
      sub_arr.each_with_index do |val, j|
        if val == position
          board[i][j] = symbol
        end
      end
    end
  else  
    puts "Please enter a number between 1 and 9."

    # if position.between?(1,3)
    #   puts "here"
    #   board[0][position-1] = symbol
    # elsif position.between?(4,6)
    #   board[1][position-1] = symbol
    # elsif position.between?(7,9)
    #   board[2][position-1] = symbol
    # end
  end
end

def check_winner(board)
  winner = nil

    board.each do |row|
      if row.uniq.length == 1
        winner = row.uniq.join()
        return winner
      end
    end

  # check columns
    board.transpose.each do |col|
      if col.uniq.length == 1
        winner = col.uniq.join()
        return winner
      end
    end

    # check diagonals
    if board[1][1] != ' ' # check if the middle of the board is not blank
      if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
        (board[0][2] == board[1][1] && board[1][1] == board[2][0])
       winner = board[1][1]
       return winner
     end
    end
  
    # # check draw
    # if check_draw(board) == true
    #   winner = "DRAW"
    #   return winner
    # end

  # end
end

def check_draw(board)
  if board.all? {|row| row.all? {|pos| pos.is_a? Integer}}
    return false
  else
    return true
  end
end



# puts "Welcome Player 1, What is your name"
# p1_name = gets.chomp
# puts "Welcome #{p1_name}, what symbol do you want to use to play?" 
# p1_symbol = gets.chomp
# puts "Welcome Player 2, what is your name?"
# p2_name = gets.chomp
# puts "Wecoome #{p2_name}, what symbol do you want to use to play? Please select something other than #{p1_symbol}."
# p2_symbol = gets.chomp

p1_name = "EL"; p1_symbol = "X"; p2_name = "MT"; p2_symbol = "Y";

player_1 = Player.new(p1_name,p1_symbol)
player_2 = Player.new(p2_name, p2_symbol)
puts "Welcome #{player_1.name}! Your symbol is #{player_1.symbol}."
puts "Welcome #{player_2.name}! Your symbol is #{player_2.symbol}."


winner = nil

until winner do
  print_board(board)
  puts "#{player_1.name}, it is your turn. Enter the positin you would like to put your #{player_1.symbol}"
  position = gets.chomp
  player_turn(position.to_i,board,player_1.symbol)
  winner = check_winner(board)
  print_board(board)
  puts "#{player_2.name}, it is your turn. Enter the positin you would like to put your #{player_2.symbol}"
  position = gets.chomp
  player_turn(position.to_i,board,player_2.symbol)
  winner = check_winner(board)
  print_board(board)
  if winner == player_1.symbol
    puts "Congratulations #{player_1.name}, you win!"
  elsif winner == player_2.symbol
    puts "Congratulations #{player_2.name}, you win!"
  elsif winner == "DRAW"
    puts "It's a draw."
  end
end



# print_board(board)

# print_board(board)
# player_turn(1,board,player_1.symbol)
# # puts board[1][1]
# # board[0][0] = player_1.symbol
# player_turn(5,board,player_1.symbol)
# player_turn(9,board,player_1.symbol)
# print_board(board)


# p check_winner(board_draw)
# p check_draw(board_draw)






