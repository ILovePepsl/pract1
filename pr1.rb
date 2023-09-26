def menu
  print str = <<here

---------------Rock, Paper, Scissors---------------
1. Play
2. Statistics
3. Exit
Your choice:
here
  gets.to_i
end #def menu


class Statistics

  def in
    @player = 0
    @hal9000 = 0
    @draw = 0
    @max_streak = 0
    @cur_streak = 0
  end

  def win
    @player += 1
    @cur_streak += 1
    @max_streak = @cur_streak if @cur_streak > @max_streak
  end

  def lose
    @hal9000 += 1
    @max_streak = @cur_streak if @cur_streak > @max_streak
    @cur_streak = 0
  end

  def draw
    @draw += 1
  end

  def stats
    <<here

-----------------------Statistics-----------------------
Player - #{@player}; Computer - #{@hal9000}; Draw - #{@draw}
Current winning streak - #{@cur_streak}
Maximum winning streak - #{@max_streak}   
--------------------------------------------------------
here
  end

end #class Statistics


def game(stat)
  print <<here

1. Rock
2. Scissors
3. Paper
Your choice:
here
  choice = gets.to_i
  bot_ch = rand(1..3)

  if choice == bot_ch
    puts 'Draw!'
    stat.draw
  elsif (choice == 1 && bot_ch == 2) ||
    (choice == 2 && bot_ch == 3) ||
    (choice == 3 && bot_ch == 1)
    stat.win
    puts 'You won!'
  else
    puts 'You lost :('
    stat.lose
  end

end #def game


def secret_game

  puts "\nCongratulations! You have unlocked the secret game 'Rock, Paper, Scissors, Lizard, Spock.'"

  loop do
    puts <<here
1. Play
2. Learn the rules
3. Return to the main menu
Your choice:
here
    case gets.to_i
    when 1
      puts 'Enter your choice:'
      choice = gets.chomp.to_s.capitalize!
      bot = %w[Rock Scissors Paper Lizard Spock].sample

      if !(%w[Rock Scissors Paper Lizard Spock].include?(choice))
        puts 'Invalid input!'
        puts
      elsif choice == bot
        puts "It's a tie! The bot chose #{bot}"
        puts
      elsif (choice == "Rock" && (bot == "Scissors" || bot == "Lizard")) ||
        (choice == "Scissors" && (bot == "Paper" || bot == "Lizard")) ||
        (choice == "Paper" && (bot == "Rock" || bot == "Spock")) ||
        (choice == "Lizard" && (bot == "Spock" || bot == "Paper")) ||
        (choice == "Spock" && (bot == "Scissors" || bot == "Rock"))
        puts "You win! The bot chose #{bot}"
        puts
      else
        puts "You lose :( The bot chose #{bot}"
        puts
      end
    when 2
      puts <<here

---------------------------------------------------------------------
The rules are simple: scissors cut paper, paper covers rock,
rock crushes lizard, lizard poisons Spock, Spock smashes scissors,
scissors decapitate lizard, lizard eats paper,
paper disproves Spock, Spock vaporizes rock,
and, as always, rock crushes scissors.
---------------------------------------------------------------------

here
    when 3
      break
    else
      puts 'Invalid input!'
      puts
    end

  end #loop

end #def secret_game

stat = Statistics.new
stat.in

loop do
  case menu
  when 1 then game(stat)
  when 2 then puts stat.stats
  when 3 then abort 'Goodbye!'
  when 24601 then secret_game
  else puts 'Invalid input!'
  end
end

