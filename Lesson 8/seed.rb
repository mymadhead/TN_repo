class Seed
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
    station_seed
    @trains << CargoTrain.new(%w[1 2 3 4].sample)
    @trains << PassengerTrain.new(%w[1 2 3 4].sample)
=begin
    wagon_seed
    route_seed
=end
  end


  def station_seed
    8.times do
      @stations << Station.new(%w[a b c d].sample + %w[l m n o p].sample + %w[1 2 3 4 5].sample)
    end
  end

  def wagon_seed

  end

  def route_seed

  end
  end