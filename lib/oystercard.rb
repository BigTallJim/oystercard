class Oystercard
  attr_reader :balance
  attr_reader :in_journey

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    check_limit(value)
    @balance = value + @balance
  end

  def check_limit(value)
    raise "Balance limit is £#{BALANCE_LIMIT}" if value + @balance > BALANCE_LIMIT
  end

  def deduct(value)
    @balance = @balance - value
  end

  def touch_in
    if @balance < MINIMUM_BALANCE
      raise "balance too low"
    end
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
