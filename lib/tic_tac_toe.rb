class TicTacToe 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
  
  def initialize 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      self.display_board
    else
      self.turn
    end
  end
  
  def play
      until (self.over?)
        self.turn
      end
      
      if (self.won?)
        puts "Congratulations #{self.winner}!" 
      else if (self.draw?)
        puts "Cat's Game!" 
      end
    end
  end
  
  def won?
   for win_combination in WIN_COMBINATIONS
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      taken_1 = self.position_taken?(win_index_1)
      taken_2 = self.position_taken?(win_index_2)
      taken_3 = self.position_taken?(win_index_3)
     
      if (taken_1 && taken_2 && taken_3)
        position_1 = @board[win_index_1] 
        position_2 = @board[win_index_2] 
        position_3 = @board[win_index_3]
        
        if (position_1 == position_2 && position_2 == position_3)
          return win_combination
        end
      end
    end
    false
  end 
  
  def full?
    output = true
    @board.each_with_index do |position, index| 
      if (!self.position_taken?(index))
        output = false 
      end 
    end
    output
  end
  
  def draw?
    if (self.full? && !self.won?)
      return true 
    else 
      false 
    end 
  end
  
  def over?
    if (self.draw?|| self.won? || self.full?)
      return true 
    else 
      false 
    end
  end
  
  def winner
    if (self.won?)
      win_combination = self.won?
      index = win_combination[0]
      player = @board[index]
      return player
    else 
      nil 
    end
  end 
  
  def turn_count
    count = 0 
    @board.each do |character|
      if (character == "X" || character == "O")
        count += 1 
      end 
    end
    count
  end 
  
  def current_player
    count = self.turn_count
    if (count % 2 == 0)
      "X" 
    else 
      "O" 
    end
  end
  
end 