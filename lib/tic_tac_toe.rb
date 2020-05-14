WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #mid row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #mid column win
  [2,5,8], #right column win
  [0,4,8], #diagonal left win
  [2,4,6], #diagonal right win
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && board[index] == " "
end

def turn(board)
  puts "Let's play! Enter 1-9 to make a move: "
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    char = current_player(board)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn

def current_player(board)
  num_of_turns = turn_count
  if num_of_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end
