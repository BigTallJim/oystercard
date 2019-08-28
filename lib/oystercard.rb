class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey
  attr_reader :journeys

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station
    @journeys = []
    @journey = {entry: nil, exit: nil}
  end

  def top_up(value)
    check_limit(value)
    @balance += value
  end

  def check_limit(value)
    raise "Balance limit is £#{BALANCE_LIMIT}" if value + @balance > BALANCE_LIMIT
  end

  def touch_in(station)
    raise "balance too low" if @balance < MINIMUM_BALANCE

    @entry_station = station
    @journey[:entry] = station

  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
    @journey[:exit] = station
  end

  def in_journey?
    @entry_station
  end

  private
  def deduct(value)
    @balance -= value
  end
end
