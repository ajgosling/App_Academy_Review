class Flight
  attr_reader :passengers
  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(pass)
    if !full? && pass.has_flight?(@flight_number)
      @passengers << pass
      true
    else
      false
    end
  end

  def list_passengers
    @passengers.map {|pass| pass.name}
  end

  def [](idx)
    @passengers[idx]
  end

  def <<(pass)
    board_passenger(pass)
  end
end