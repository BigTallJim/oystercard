class Journey
attr_accessor :entry_station, :exit_station
PENALTY = 6
MINIMUMFARE = 1
  def intialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    @entry_station == nil || @exit_station == nil ? PENALTY : MINIMUMFARE
  end

end
