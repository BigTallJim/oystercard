require 'journey'

class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey
  attr_reader :journeys

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
    @journey = Journey.new
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

    @journey = Journey.new
    @journey.entry_station = station

  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @journey.finish(station)
    save_journey
  end

  def in_journey?
    @journey.entry_station
  end

  private
  def deduct(value)
    @balance -= value
  end

  def save_journey
    @journeys << @journey
  end
end
