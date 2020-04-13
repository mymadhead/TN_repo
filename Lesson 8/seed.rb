class Seed
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
    station_seed
    @trains << CargoTrain.new(number, type)
    @trains << PassengerTrain.new(number, type)
    wagon_seed
    route_seed
  end

  def seed
    seed = Seed.new
    @stations = seed.stations
    @trains = seed.trains
    @routes = seed.routes
    seed_message
  end

  def seed_message
    puts 'Stations, routes and trains successfully created!'
  end

  def station_seed
    8.times do
      @stations << Station.new(%w[a b c d].sample + %w[l m n o p].sample + %w[1 2 3 4 5].sample)
    end
  end

  def wagon_seed

  end

  def add_wagons

  end

  def route_seed

  end
  end