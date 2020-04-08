require 'pry'

class TicTacToe


 WIN_COMBINATIONS =[
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
 ]
    def initialize

      @board = Array.new(9," ")
   end

   def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)

     user_input.to_i-1
   end

   def move(index, token )#="X")

         @board[index]=token

   end

  def position_taken?(index)
      #  binding.pry
    #  if

       @board[index] != " "
      #   true
      #
      # else
      #   false
      #
      # end
    #     binding.pry
    # else
    #   true
    # end
  end

  def valid_move?(position)

    # @board[position] == " "

     !position_taken?(position) && position.between?(0,8)#  @board[position] == "X" || @board[position] == "O"
    #   false
    # else
    #   true
    # end

  end
 def turn_count
   @board.count{|value| value !=" "}
 end

def current_player

turn_count.even? ? "X" : "O"
end

   def turn
     puts "Enter a number between 1-9"
     user = gets.chomp
      index = input_to_index(user)

     if valid_move?(index)
       move(index,current_player)
         display_board
      else
        puts "Wrong input"
        turn
   end
end

  def won?
    WIN_COMBINATIONS.each{ |value|
      index_1= value[0]
      index_2= value[1]
      index_3= value[2]

      index1= @board[index_1]
      index2= @board[index_2]
      index3= @board[index_3]

      if index1 =="X" && index2== "X" && index3=="X"
              return value
      elsif  index1 =="O" && index2== "O" && index3=="O"
              return value
      end
    }
     return  false
    end

   def full?

     @board.all? {|value|

     value == "X" || value=="O" }
   end

   def draw?
    @board.all?{|value| value=="X"|| value=="O" && !won?}
   end
 def over?
    if won? || full?
        return true
    end
 end

  def winner
   if won?
     @board[won?[0]]=="X" ? "X" : "O"
   else
     nil
  end
end
end
