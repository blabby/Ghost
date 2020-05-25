require_relative "player.rb"
require "set"

class Game
    attr_accessor :fragment, :players, :dictionary
    def initialize
        puts "Welcome to Ghost"
        puts "Enter players: (Ex:james michael brandon scott)"
        players = gets.chomp.split(" ")
        puts "How to play: keep entering letters that correspond to a word but does not complete a word"
        puts "If you enter a letter that completes a word/is invalid, you get a letter, if you get 5 letters you lose and everyone else wins!"
        @players = players.map {|p| Player.new(p)}
        @dictionary = File.readlines("dictionary.txt").map(&:chomp).to_set
        @fragment = ""
        take_turn
    end

    def take_turn
        game = true
        while game

        puts "#{current_player.name}'s turn."
        puts "Enter a letter"
        letter = gets.chomp
        while letter.length != 1 
        puts "Please enter one letter:"
            letter = gets.chomp
        end
        if valid?(letter)
            puts "#{fragment}"
        else
            puts "#{current_player.name} has spelt: #{@fragment += letter}"
            puts "#{current_player.name} has lost this round."
            @fragment = ""
            if current_player.add_score
            puts "#{current_player.name} has received letter #{current_player.score.last}."
            else
                puts "#{current_player.name} has received letter #{current_player.score.last}."
                puts "#{current_player.name} has lost the game!"
                game = false
            end
        end
        switch_players
    end
    puts "GAME OVER!"
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

Game.new