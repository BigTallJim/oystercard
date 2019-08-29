class Station
  attr_reader :station_name, :station_zone
  
  def initialize(name = "Default", zone = 0)
    @station_name = name
    @station_zone = zone
  end
end
