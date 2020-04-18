# frozen_string_literal: true

class Seed
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
    station_seed
    @trains << CargoTrain.new(%w[1 2 3 4].sample)
    @trains << PassengerTrain.new(%w[1 2 3 4].sample)
    # route_seed
  end

  def station_seed
    8.times do
      @stations << Station.new(%w[a b c d].sample + %w[l m n o p].sample + %w[1 2 3 4 5].sample)
    end
  end

  #   def route_seed
  #     @routes << Route.new(stations.first, stations.last)
  #     @routes.first.add_transit_station(stations[1])
  #     @routes.first.add_transit_station(stations[2])
  #   end
end
