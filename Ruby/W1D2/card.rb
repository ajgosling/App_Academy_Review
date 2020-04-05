class Card
    def initialize(value)
        @value = value
        @revealed = false
    end

    def reveal
        @revealed = true
    end

    def hide
        @revealed = false
    end

    def to_s
        return @value
    end

    def ==(other_card)
        return self.to_s == other_card.to_s
    end
end
