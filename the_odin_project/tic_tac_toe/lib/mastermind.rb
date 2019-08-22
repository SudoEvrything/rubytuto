class Mastermind
  def initialize
    @board = Board.new
    @player = Player.new('Player', @board)
    @computer = Computer.new('Computer', @board)
    @current_player;
  end

  def start_game
    loop do
      puts "Which role do you want to play?"
      puts "1. Codemaker 2. Codebreaker"
      puts "Please select 1 or 2: "
      @role = gets.chomp.to_i
      break if @role == 1 || @role == 2
    end

    if @role == 1
      @current_player = @computer
      codemaker_mode
    else
      @current_player = @player
      codebreaker_mode
    end
  end

  def codebreaker_mode

    instructions
    @chances = 12
    loop do
      p @player.get_guess
      p @board.give_clues(@player.guess)
      chances_left
      break if game_over?
    end
  end

  def codemaker_mode
    @board.secret = @player.make_code
    @chances = 12
    loop do
      p @computer.make_guess(@board.clues)
      p @board.give_clues_cpu(@computer.guess)

      chances_left
      break if game_over?
    end
  end

  def instructions
    puts "======================================="
    puts "======= Welcome to Mastermind! ========"
    puts "======================================="
    puts "Your goal is to crack the secret code!"
    puts "The secret code is 4 digits long. "
    puts "The numbers are between 1-6 and can repeat."
    puts "After each guess you will get some clues."
    puts "'x' means right number and right spot."
    puts "'o' means right number but wrong spot."
    puts "You have a total of 12 chances."
    puts "Have fun! :)"
  end

  def game_over?
    victory? || out_of_chances?
  end

  def victory?
    if @current_player.guess == @board.secret
      puts '=== Congratulations, you won! ==='
      true
    end
  end

  def out_of_chances?
    if @chances == 0
      puts '=== Game Over! ==='
      puts "The secret code was #{@board.secret}"
      true
    end
  end

  def chances_left
    @chances -= 1
    puts "You have #{@chances} chances left"
  end
end

class Player
  attr_reader :guess, :name

  def initialize(name, board)
    @name = name
    @board = board
  end

  def get_guess
    loop do
      print "Enter a 4 digit number: "
      @guess = gets.chomp
      break if check_guess
    end
    print "Player guess: "
    convert
  end

  def check_guess
    if @guess.scan(/\D/).any?
      puts "Numbers only. Please try again."
      false
    elsif @guess.length != 4
      puts "4 digits only. Please try again."
      false
    elsif @guess.scan(/[^1-6]/).any?
      puts "Only numbers between 1-6 are allowed."
      false
    else
      true
    end
  end

  def convert
    converted = []
    @guess = @guess.split('')
    @guess.each { |x| converted << x.to_i }
    @guess = converted
  end
  
  def make_code
    loop do
      print "Please enter a secret code: "
      @guess = gets.chomp
      break if check_guess
    end
    convert
  end
end

class Computer
  attr_reader :guess, :name

  def initialize(name, board)
    @name = name
    @board = board
    @guess = ['', '', '', '']
    @garbage = [1,2,3,4,5,6]
  end

  def make_guess(clues)
    @clues = clues
    @guess.each_with_index do |num, index|
      if @clues[index] == 'x'
        next
      elsif @clues[index] == '-'
        @garbage -= [@guess[index]]
        @guess[index] = @garbage.sample
      else
        @guess[index] = @garbage.sample
      end
    end
    p @garbage
    print "CPU guess: "
    @guess
  end
end
 
class Board
  attr_accessor :secret, :clues
  def initialize
    @clues = ['-','-','-','-']
    @secret = []
    4.times do
      @secret<< rand(1..6)
    end
  end

  def give_clues(guess)
    clues = []
    remain = [0,1,2,3]
    temp = []
    guess.each_with_index do |num, index|
      if num == @secret[index]
        remain -= [index]
        clues << 'x'
      end
    end

    remain.each do |x|
      temp << @secret[x]
    end

    remain.each do |x|
      if temp.include?(guess[x])
        clues << 'o'
      end
    end
    print "Player clues: "
    clues
  end

  def give_clues_cpu(guess)
    @clues = []
    remain = [0,1,2,3]
    temp = []

    guess.each_with_index do |num, index|
      if num == @secret[index]
        remain -= [index]
        @clues[index] = 'x'
      end
    end

    remain.each do |x|
      temp << @secret[x]
    end

    remain.each do |x|
      if temp.include?(guess[x])
        @clues[x] = 'o'
      else 
        @clues[x] = '-'
      end
    end
    print "CPU clues: "
    @clues
  end
end

tt = Mastermind.new
tt.start_game