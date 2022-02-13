class Tile
  def initialize
    @symbol = "*" # star will represent an unexplored square
    @bomb, @explored, @flagged = false, false, false
  end

  def bomb?
    @bomb
  end

  def bombify
    @bomb = true
  end

  def explored?
    @explored
  end

  def explore(str_num)
    if str_num == "0"
      @symbol = "_"
    else
      @symbol = str_num
    end
    @explored = true
  end

  def flag
    @flagged = !@flagged
  end

  def flagged?
    @flagged
  end

  def to_s
    flagged? ? "F" : @symbol
  end
end
