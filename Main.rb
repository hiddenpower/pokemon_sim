require_relative 'Move.rb'
require_relative 'Pokemon.rb'
require_relative 'Battle.rb'
require_relative 'Trainer.rb'
require_relative 'Explore.rb'
@game = ""

@p1nick = ""
until @p1nick != ""
  puts "What is your name, trainer?"
  @p1nick = gets.chomp.capitalize
end

@p1name = 0
puts "\nSelect the starter who will be your partner"
until @p1name.between?(1,3)
  puts "This are your choices:"
  puts "1: Bulbasaur 2: Charmander 3: Squirtle"
  @p1name = gets.chomp.to_i
end
puts "\nGreat! Your starter is level 1"
@p1level = 1

case @p1name
  when 1
    @p1name = "bulbasaur"
  when 2
    @p1name = "charmander"
  when 3
    @p1name = "squirtle"
  else
    puts ""
end

pokemon = Pokemon.new(@p1name, @p1level)
puts pokemon.ascii

puts "\nNow your adventure starts!"

#Rival name
@p2nick = "Rival"
#Pokemon Rival
@p2name = "Pikachu"
#Rival's pokemon level
@p2level = @p1level

explore = Explore.new
explore.walk

until @game == "over"

    rival = Pokemon.new(@p2name, @p1level)
    puts rival.ascii
    battle = Battle.new(Trainer.new(@p1nick), Trainer.new(@p2nick))
    battle.set_pokemon(battle.get_trainer(@p1nick), @p1name, @p1level)
    battle.set_pokemon(battle.get_trainer(@p2nick), @p2name, @p2level)
    battle.trainer1.active_pokemon = battle.trainer1.pokemon_list.first
    battle.trainer2.active_pokemon = battle.trainer2.pokemon_list.first
    until battle.finished
      if battle.turn.nick == "Rival"
        puts ""
        puts "#{battle.turn.nick} is making his move"
        puts battle.fight(rand(0..2))
      else
        puts ""

        choice = 5
        until choice.between?(0,2)
          puts "#{battle.turn.nick} select your attack:"
          puts battle.get_moves
          puts "2: Defend!"
          puts "3: Run!"
          choice = gets.chomp.to_i
        end
        puts battle.fight(choice)
      end
    end
    explore.walk
end
