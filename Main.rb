require_relative 'Move.rb'
require_relative 'Pokemon.rb'
require_relative 'Battle.rb'
require_relative 'Trainer.rb'

puts "What is your name, trainer?"
p1nick = gets.chomp
puts "\nType the name of the starter who will be your partner"
puts "This are your choices:"
puts "Bulbasaur, Charmander, Squirtle"
p1name = gets.chomp
puts "\nGreat! Your starter is level 1"
p1level = 1

#Rival name
p2nick = "Rival"
#Pokemon Rival
p2name = "Pikachu"
#Rival's pokemon level
p2level = 1

pokemon = Pokemon.new(p1name, p1level)
puts pokemon.ascii
battle = Battle.new(Trainer.new(p1nick), Trainer.new(p2nick))
battle.set_pokemon(battle.get_trainer(p1nick), p1name, p1level)
battle.set_pokemon(battle.get_trainer(p2nick), p2name, p2level)
battle.trainer1.active_pokemon = battle.trainer1.pokemon_list.first
battle.trainer2.active_pokemon = battle.trainer2.pokemon_list.first
until battle.finished
  if battle.turn.nick == "Rival"
    puts ""
    puts "#{battle.turn.nick} is making his move"
    puts battle.fight(rand(0..2))
  else
    puts ""
	  puts "#{battle.turn.nick} select your attack:"
    puts battle.get_moves
    puts "2: Defend!"
  	puts battle.fight(gets.chomp.to_i)
  end
end
