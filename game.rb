require_relative "player.rb"
require "set"

class Game
    attr_accessor :fragment, :players, :dictionary
    def initialize(*players)
        @players = players.map {|p| Player.new(p)}
        @dictionary = File.readlines("dictionary.txt").map(&:chomp).to_set
        @fragment = ""
        #take_turn
    end

    def take_turn
    end

    def valid?(letter)
        frag = @fragment
        frag += letter
        if !valid_letter?(frag) || !valid_word?(frag)
            return false
        end
            @fragment += letter
            true
    end

    def valid_letter?(frag)
        @dictionary.each do |word|
         if word.include?(frag)    
            return true
         end
        end
        false
    end

    def valid_word?(frag)
        @dictionary.each do |word|
            if word == frag
                return false
            end
        end
        true
    end

    def switch_players
        first = players.shift
        players << first
    end

    def current_player
        players.first
    end 
end