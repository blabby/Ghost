require_relative "player.rb"
require "set"
class Game
    attr_reader :dictionary
    attr_accessor :fragment, :players
    def initialize(*players)
        @players = players.map {|p| Player.new(p)}
        @dictionary = Set["yolk","potato","apple"] #using these words for testing purposes
        # @dictionary = Set[File.readlines("dictionary.txt").map(&:chomp)]
        @fragment = "yol"
    end

    #now need methods for gameplay/guessing
    def take_turn
        puts "Enter a letter"
        letter = gets.chomp
        if valid?(letter)
            puts "valid, goes to next player"
        else
            #lose condition
            #current_player loses
            puts "you lose!"
        end
    end

    def valid?(letter)
        frag = fragment
        frag += letter
        if dictionary.include?(frag) && !lose?(frag)
            false
        else
            @fragment += letter
            true
        end
    end

    def lose?(word)
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

