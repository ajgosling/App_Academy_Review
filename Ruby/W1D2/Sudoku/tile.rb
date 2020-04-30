require 'colorize'

class Tile
    attr_reader :value
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

    def value=(value)
        unless @given
            @value = value
        end
    end
end