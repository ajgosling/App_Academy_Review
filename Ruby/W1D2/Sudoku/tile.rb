require 'colorize'

class Tile
    def initialize(value, given)
        @value = value
        @given = given

    end

    def to_s
        if @given
            return @value.to_s.colorize(:light_green)
        elsif @value
            return @value.to_s
        else
            return " "
        end
    end
end