class HumanPlayer
    attr_accessor :name

    def initialize(name = "Goose")
        @name = name
    end

    def get_play
        return gets.chomp.split(",").map {|el| el.to_i}
    end
end
