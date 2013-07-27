require 'json'
$pokemon = JSON.parse(open("pokedex.json").read, :symbolize_names => true)
class Pokemon
	attr_accessor :name, :hp, :accuracy
	attr_reader :moves, :level, :maxhp, :ascii
	def initialize(name, level=1)

    @level = level
		pokemon = $pokemon[name.downcase.gsub(/\W/,'').to_sym]
		raise(ArgumentError, "That pokemon does not exist") if pokemon.nil?
		@ascii = pokemon[:ascii]
		@name = pokemon[:name]
		@hp = pokemon[:hp] + (level -1)
		@maxhp = pokemon[:hp] + (level -1)
		@accuracy = 100
		@moves = pokemon[:moves].collect{|m| Move.new(m)}.select{|m| m.category != :status}.sample(2)
	end

	def list_moves
		@moves.length.times.collect {|i| "#{i}: #{@moves[i].name}, #{@moves[i].type}, #{@moves[i].category}, power:#{@moves[i].power}" if @moves[i]}.compact.join("\n")
	end

	def fight(moveNumber, opponentPokemon)
		if moveNumber == 2
      unless @hp >11
        @hp += 2
      end
      return "#{name} is defending"
    else
      move = moves[moveNumber]
      c = rand(5)==0 ? 2 : 1
		  #c = 1
      message = ''
		  if c==2
			  message += "It was a critical hit! "
		  end

		  movePower = (move.power * c).floor
		    if move.accuracy != '--' and rand(1..100) > ((move.accuracy * accuracy)/100.0)
			    return "#{name} missed."
		    else
			    opponentPokemon.hp -= movePower
			    return "#{message}#{name} used #{move.name} and dealt #{movePower} damage to #{opponentPokemon.name} \n#{opponentPokemon.name} has #{opponentPokemon.hp}hp left"
        end
      end
	  end
end
