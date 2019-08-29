class Journey
attr_accessor :entry_station, :exit_station
PENALTY = 6
MINIMUMFARE = 1
  def intialize(entry = nil)
    @entry_station = entry
    #@exit_station = nil
  end

  def fare
    complete? ? MINIMUMFARE : PENALTY
  end

  def complete?
    @entry_station.nil? == false && @exit_station.nil? == false
  end

  def finish(station)
      @exit_station = station
      self
  end
end
