class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
  end
  
  def start
    puts "New Game Started. Welcome #{@player_1.name} and #{@player_2.name}"
    round
  end

  def ask_question(name)
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @sum = @num_1 + @num_2
    puts "#{name}: What does #{@num_1} plus #{@num_2} equal?"
  end

  def check_answer?(input)
    @sum == input
  end

  def round
    ask_question(@player_1.name)
    print '> '
    @input = $stdin.gets.chomp
    if @sum == @input.to_i
      puts 'Yes! You are correct.'
    else
      @player_1.life_decrease
      puts 'Seriously? No!'
    end
    check_score
    ask_question(@player_2.name)
    print '> '
    @input = $stdin.gets.chomp
    if @sum == @input.to_i
      puts 'Yes! You are correct.'
    else
      @player_2.life_decrease
      puts 'Seriously? No!'
    end
    check_score
    show_stats
    puts '-----------NEW-TURN-----------'
    round
  end
  
  def check_score
    if @player_1.dead
      winner(@player_2)
    elsif @player_2.dead
      winner(@player_1)
    end
  end

  def show_stats
    puts "P1: #{@player_1.life}/3 vs P2: #{@player_2.life}/3"
  end

  def winner(player)
    puts "#{player.name} wins with the score of #{player.life}/3"
    puts '-----------GAME-OVER----------'
    puts 'Good bye!'
    exit(0)
  end


end