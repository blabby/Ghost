require_relative "player.rb"
class Game
    attr_reader :dictionary
    attr_accessor :fragment, :players
    def initialize(*players)
        @players = players.map {|p| Player.new(p)}
        @dictionary = ["yolk","potato","apple"] #using these words for testing purposes
        # @dictionary = File.readlines("dictionary.txt").map(&:chomp)
        @fragment = "yol"
    end

    def valid?(letter)
        frag = fragment
        frag += letter
        if dictionary.include?(frag)
            dictionary += letter
            true
        else
            false
        end
    end

    def lose?
        dictionary.each do |word|
            if word == fragment
                return true
        end
    end
        false
    end

    def switch_players
        first = players.shift
        players << first
    end

    def current_player
        players.first
    end 


end

