class Card
    VALUES = "ABCDEFGH".chars

    def initialize
        @value = VALUES.sample
        @revealed = false
    end

    def reveal
        @revealed = true
        return @value
    end

    def hide
        @revealed = false
    end

    def to_s
        return @revealed ? @value : 'x'
    end

    def ==(other_card)
        return self.to_s == other_card.to_s
    end
end