class Player
    attr_accessor :name, :score
    def initialize(name)
        @name = name
        @score = []
    end

    def add_score
        length = @score.length 

        case length
        when 0
            @score << "G"
            true
        when 1
            @score << "H"
            true
        when 2
            @score << "O"
            true
        when 3
            @score << "S"
            true
        when 4
            @score << "T"
            false
        else
            false
        end
    end
end