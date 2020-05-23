class Game
    attr_reader :dictionary
    attr_accessor :fragment
    def initialize(*players)
        @players = players
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


end

