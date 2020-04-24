# frozen_string_literal: true

class Interface
  def main_menu
    puts 'Please chose what do you want to do:'
    puts 'Type 1, to create station'
    puts 'Type 2, to create train'
    puts 'Type 3, to create route'
    puts 'Type 4, to add station at the route'
    puts 'Type 5, to remove station at the route'
    puts 'Type 6, to assign route to the train'
    puts 'Type 7, to add wagon to the train'
    puts 'Type 8, to remove wagon from train'
    puts 'Type 9, to take seat at wagon'
    puts 'Type 10, to take volume at wagon'
    puts 'Type 11, to move train forward on route'
    puts 'type 12, to move train backward on route'
    puts 'Type 13, to watch station list'
    puts 'Type 14, to watch train list'
    puts 'Type 15, to watch wagons list'
    puts 'Type 16, to increase speed of a train'
    puts 'Type 17, to decrease speed of a train'
    puts 'Type 18, to add test data(stations, trains, routes)'
    puts 'Type 19, to test accessors'
    puts 'Type 20, to exit'
  end

  MENU_CHOICE = {
    1 => :create_station_menu,
    2 => :create_train_menu,
    3 => :create_route_menu,
    4 => :add_station_menu,
    5 => :remove_station_menu,
    6 => :set_route_menu,
    7 => :add_wagon_menu,
    8 => :remove_wagon_menu,
    9 => :take_seat_at_chosen_wagon,
    10 => :take_volume_at_chosen_wagon,
    11 => :go_next_station_menu,
    12 => :go_previous_station_menu,
    13 => :stations_list,
    14 => :trains_list,
    15 => :wagons_list,
    16 => :increase_speed,
    17 => :decrease_speed,
    18 => :seed,
    19 => :test_accessors,
    20 => :exit
  }.freeze

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu_choice
    user_choice = 0
    until (1..20).cover?(user_choice)
      main_menu
      user_choice = gets.to_i
    end

    send(MENU_CHOICE[user_choice])
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

  def create_station_menu
    puts 'Type station name:'
    input
    @stations << Station.new(@input)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Station #{@input} was created."
  end

  def create_route_menu
    if @stations.nil? || @stations.size < 2
      puts 'Firstly create at least 2 stations.'
      create_station_menu
    else
      begin
      stations_list
      puts 'Type number of departure station:'
      input
      input until valid_input?(@stations)
      departure = @stations[@input.to_i - 1]
      puts 'Type number of destination station:'
      while !valid_input?(@stations) || @stations[@input.to_i - 1] == departure
        input
      end
      destination = @stations[@input.to_i - 1]
      @routes ||= []
      @routes << Route.new(departure, destination)
      rescue StandardError => e
        puts e.message
        retry
      ensure
        puts 'New route was created.'
    end
    end
  end

  def create_train_menu
    puts 'What train you want to create? 1. Cargo 2. Passenger'
    user_choice = gets.to_i
    begin
      puts 'Type train number'
      number = gets.chomp
      add_train(number, user_choice)
    rescue RuntimeError => e
      puts e.message
      retry
    end
    puts "Train added #{number}"
  end

  def add_train(_number, user_choice)
    case user_choice
    when 1
      create_cargo_train
    when 2
      create_pass_train
    else
      puts 'Wrong input!'
    end
  end

  def create_pass_train
    puts 'Please, type train number:'
    @trains ||= []
    @trains << PassengerTrain.new(input)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Passenger train #{@input} was created!"
  end

  def create_cargo_train
    puts 'Please, type train number:'
    @trains ||= []
    @trains << CargoTrain.new(input)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Cargo train #{@input} was created!"
  end

  def create_pass_wagon
    puts 'Type number of passenger wagon:'
    input
    number = @input
    puts 'Type number of seats:'
    input
    seats = @input.to_i
    @wagons ||= []
    @wagons << PassengerWagon.new(number, seats)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Passenger wagon #{number} with seats count: #{seats} was created!"
  end

  def create_cargo_wagon
    puts 'Type number of cargo wagon:'
    input
    number = @input
    puts 'Type wagon volume:'
    input
    volume = @input.to_i
    @wagons ||= []
    @wagons << CargoWagon.new(number, volume)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Cargo wagon #{number} with volume #{volume} was created!"
  end

  def set_route_menu
    routes_list
    if !@routes
      puts 'Need to create some route!'
      create_route_menu
    else
      puts 'Enter number of the route:'
      input
      input until valid_input?(@routes)
      @trains.assign_route(@routes[@input.to_i - 1])
      puts "The route #{@routes[@input.to_i - 1]} was set to #{@trains.number}"
    end
  end

  def chose_wagon(type)
    if !@wagons
      puts 'Firstly create some wagon.'
      create_wagon_menu
      @wagon = wagons[0]
    elsif @wagons.select { |wagon| wagon.type == type }.empty?
      puts "Create some #{type} wagon at first"
      create_wagon_menu
      @wagon = @wagons.find { |wagon| wagon.type == type }
      puts "Wagon #{@wagon.number} was chosen."
    else
      puts 'Enter wagon number:'
      input
      input until wagon_by_number(@input)
      @wagon = wagon_by_number(@input)
      puts "Wagon #{@wagon.number} was chosen."
    end
  end

  def add_chosen_wagon
    if @wagon.type != @trains.type
      puts 'Wrong type of wagon!'
      puts 'Chose another wagon or train.'
      add_wagon_menu
    elsif @trains && @wagon
      @trains.add_wagon(@wagon)
      puts "Wagon #{@wagon.number} added to the train #{@trains.number}."
    elsif !@trains
      puts 'Chose some train at first!'
      add_chosen_wagon
    elsif !@wagon
      puts 'Chose some wagon at first!'
      add_wagon_menu
    elsif @speed.positive?
      puts 'Stop the train at first!'
    else
      puts 'Wrong type of wagon.'
    end
  end

  def wagon_by_number(number)
    @wagons.find { |wagon| wagon.number == number }
  end

  def remove_wagon_menu
    choose_wagon(@trains.wagons)
    @trains.remove_wagon(@wagons)
    puts "Wagon #{@wagon.number} was removed from train #{@train.number}"
  rescue StandardError => e
    puts e.message
  end

  def increase_speed
    puts 'Type number of a train:'
    input
    train = Train.find(@input)
    if train.nil?
      puts 'No train at that number!'
    else
      puts 'What speed you want assign to the train?'
      input
      train.speed_up(@input.to_i)
      puts "Speed of a train № #{train.number} was increased to #{@input}"
    end
  end

  def decrease_speed
    puts 'Type number of a train:'
    input
    train = Train.find(@input)
    if train.nil?
      puts 'No train at that number!'
    else
      puts 'What speed you want assign to the train?'
      input
      train.speed_down(@input.to_i)
      puts "Speed of a train № #{train.number} was increased to #{@input}"
    end
  end

  def add_station_menu
    puts 'For adding station:'
    if !@routes
      puts 'Firstly create some route.'
      create_route_menu
    else
      puts 'Chose route:'
      routes_list
      input
      input until valid_input?(@routes)
      route_index = @input.to_i - 1
      puts 'Chose station:'
      stations_list
      input
      input until valid_input?(@stations)
      station_index = @input.to_i - 1
      until @routes[route_index].stations.include?(@stations[station_index])
        @routes[route_index].add_transit_station(@stations[station_index])
      end
      puts "Station #{@stations[@input.to_i - 1].name} added to chosen route."
    end
  end

  def remove_station_menu
    if !@routes
      puts 'Create some route at first!'
      create_route_menu
    else
      puts 'To delete station:'
      puts 'Chose route:'
      routes_list
      input
      input until valid_input?(@routes)
      route_index = @input.to_i - 1
      if @routes[route_index].stations.size == 2
        puts 'Route must contents at least 2 stations!'
        puts "You can't delete station, anymore."
      else
        puts 'Chose station:'
        route_stations_list
        input
        input until valid_input?(@stations)
        while @routes.include?(@stations[@input.to_i])
          @routes[route_index].del_transit_station(@stations[@input.to_i - 1])
        end
        puts "St.#{@stations[@input.to_i - 1].name} deleted from chosen route."
      end
    end
  end

  def go_next_station_menu
    @trains.move_forward
    puts "Train #{@trains.number} on #{@trains.current_station.name} station."
  rescue StandardError => e
    puts e.message
  end

  def go_previous_station_menu
    @trains.move_backward
    puts "Train #{@trains.number} on #{@trains.current_station.name} station."
  rescue StandardError => e
    puts e.message
  end

  def take_seat_at_chosen_wagon
    @wagon.take_seat
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "In #{@wagon.number} taken 1 seat."
  end

  def take_volume_at_chosen_wagon
    puts 'What amount of volume you wanna take?'
    @wagon.take_volume(input.to_i)
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts " Taken #{@input} volume of the #{@wagon.number}"
  end

  def chose_train(type)
    if !@trains
      puts 'Create some train at first!'
      create_train_menu
      @train = @trains[0]
      puts "Train #{@trains[0]} was chosen."
    elsif @trains.select { |train| train.type == type }.empty?
      puts "Create some #{type} train at first!"
      create_train_menu
      chose_train(type)
    else
      puts 'Type train number:'
      input
      input until Train.find(@input)
      @train = Train.find(@input)
      puts "Train #{@train.number} was chosen!"
    end
  end

  def input
    @input = gets.chomp.downcase
  end

  def valid_input?(arr)
    @input.to_i.positive? && @input.to_i <= arr.size
  end

  def stations_list
    puts 'Stations:'
    @stations.each do |station|
      puts "#{@stations.index(station) + 1}: #{station.name}"
    end
  rescue StandardError
    puts 'You must create some station!'
  end

  def routes_list
    puts 'Routes:'
    @routes.each { |route| puts "#{@routes.index(route) + 1}: #{route}" }
  rescue StandardError
    puts 'You must create some route!'
  end

  def trains_list
    puts 'Trains:'
    @trains.each { |train| puts "#{train.number} - #{train.type}" }
  rescue StandardError
    puts 'You must create some train!'
  end

  def pass_trains_list
    puts 'Passenger trains:'
    pass_trains = @trains.select { |train| train.type == 'pass' }
    pass_trains.each { |train| puts train.number.to_s }
  rescue StandardError
    puts 'You must create some train!'
  end

  def cargo_trains_list
    puts 'Cargo trains:'
    cargo_trains = @trains.select { |train| train.type == 'cargo' }
    cargo_trains.each { |train| puts train.number.to_s }
  rescue StandardError
    puts 'You must create some train!'
  end

  def pass_wagons_list
    puts 'Passenger wagons:'
    pass_wagons = @wagons.select { |wagon| wagon.type == 'pass' }
    pass_wagons.each { |wagon| puts wagon.number.to_s }
  rescue StandardError
    puts 'You must create some train!'
  end

  def cargo_wagons_list
    puts 'Cargo wagons:'
    cargo_wagons = @wagons.select { |wagon| wagon.type == 'cargo' }
    cargo_wagons.each { |wagon| puts wagon.number.to_s }
  rescue StandardError
    puts 'You must create some train!'
  end

  def train_wagons_list
    puts "Wagons of the train #{@trains.number}"
    @trains.wagons.each do |wagon|
      puts "#{@trains.wagons.index(wagon) + 1}: #{wagon.number}"
    end
  rescue StandardError
    puts 'You must create some wagon!'
  end

  def route_stations_list
    puts 'Stations of the current route:'
    @routes[@input.to_i - 1].each do |station|
      puts "#{@routes[@input.to_i - 1].index(station) + 1}: #{station.name}"
    end
  rescue StandardError
    puts 'You must create some stations to routes at first!'
  end

  def current_station_trains_list
    if !@stations
      puts 'Create some stations at first!'
      create_station_menu
    else
      stations_list
      puts 'Enter number of station:'
      input until valid_input?(@stations)
      station_number = @input.to_i
      puts "On current station #{@stations[station_number - 1].name}:"
      if !@stations[station_number - 1].trains
        puts '0 trains.'
      else
        puts 'Passenger trains on station:'
        puts @stations[station_number - 1].trains_by_type('pass').each.number
        puts 'Cargo trains on station:'
        puts @stations[station_number - 1].trains_by_type('cargo').each.number
      end
    end
  end

  def test_accessors
    w = Wagon.new
    puts "New wagon added #{w}"
    w.manufacturer = 'rzhd'
    puts "Manufacturer: #{w.manufacturer}"
    w.manufacturer = 'rzhd2'
    puts "New manufacturer: #{w.manufacturer}"

    puts "Manufacturer history: #{w.manufacturer_history.join(', ')}"

    puts "Testing strong accessors, valid format #{w.test_strong = 'kslslsl'}"
    puts "Тестируем strong accessors, not valid format #{w.test_strong = 333}"
  end
end
