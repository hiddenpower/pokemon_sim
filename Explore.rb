require_relative 'Move.rb'
require_relative 'Pokemon.rb'
require_relative 'Battle.rb'
require_relative 'Trainer.rb'


class Explore
  def initialize
    @path = 0
    @fight = 0
    @rest = 0
  end

  def walk
    until @path.between?(1,5)
      puts "\nSelect a path"
      puts "1: North 2: South 3: East 4:West 5:Rest"
      @path = gets.chomp.to_i
    end
    case @path
      when 1..4
        chance = 1
      else
        chance = 0
        @rest += 1
    end

    if @rest == 3
      chance = rand(0..2)
      @rest = 0
    end

    if chance == 1
      @fight = 1
      puts "Wild pokemon appears!!!"
      return
    else
      @path = 0
      puts "Lets get some rest"
      walk
    end

  end
end