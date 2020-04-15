# frozen_string_literal: true

# Interface class

class Interface
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

  def start
    puts 'Welcome to RailWay!'
    main_menu
  end

  private

  def main_menu
    puts 'Please choose what do you want to do:'
    puts 'Type 1, to create station, route for train or add/remove wagons from train.'
    puts 'Type 2, to use created stations, routes, wagons.'
    puts 'Type 3, to look at created stations, routes, wagons.'
    puts 'Type 4, to test program.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      create_menu
    when '2'
      created_menu
    when '3'
      watch_menu
    when '4'
      seed
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      main_menu
    end
  end

  def create_menu
    puts 'What do you want to do?'
    puts 'Type 1, to create a station.'
    puts 'Type 2, to create a train.'
    puts 'Type 3, to create a route for train.'
    puts 'Type 4, to create a wagon.'
    puts 'Type 5, to go to the main menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      create_station_menu
    when '2'
      create_train_menu
    when '3'
      create_route_menu
    when '4'
      create_wagon_menu
    when '5'
      main_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      create_menu
    end
  end

  def created_menu
    puts 'What do you want to use?'
    puts 'Type 1, to use created routes.'
    puts 'Type 2, to use created trains.'
    puts 'Type 3, to use created wagons.'
    puts 'Type 4, to go to the main menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      use_created_routes_menu
    when '2'
      use_created_trains_menu
    when '3'
      use_created_wagons_menu
    when '4'
      main_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      created_menu
    end
  end

  def watch_menu
    puts 'What do you looking for?'
    puts 'Type 1, to look at created stations.'
    puts 'Type 2, to look at created trains.'
    puts 'Type 3, to look at created routes.'
    puts 'Type 4, to look at trains on current station.'
    puts 'Type 5, to look at wagons attached to train.'
    puts 'Type 6, to go the main menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      stations_list
    when '2'
      trains_list
    when '3'
      routes_list
    when '4'
      current_station_trains_list
    when '5'
      pass_wagons_list
      cargo_wagons_list
    when '6'
      main_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      watch_menu
    end
  end

  def use_created_trains_menu
    puts 'What do you want to do?'
    puts 'Type 1, to create a route for a train.'
    puts 'Type 2, to attach a wagon to the train.'
    puts 'Type 3, to remove a wagon from a train.'
    puts 'Type 4, to increase speed of a train.'
    puts 'Type 5, to decrease speed of a train.'
    puts 'Type 6, to go to the previous station.'
    puts 'Type 7, to go to the next station.'
    puts 'Type 8, to the previous menu.'
    puts 'Type 9, to the main menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      set_route_menu
    when '2'
      add_wagon_menu
    when '3'
      train_wagons_list
      remove_wagon_menu
    when '4'
      increase_speed
    when '5'
      decrease_speed
    when '6'
      set_route_menu until @trains.route
      go_previous_station_menu
    when '7'
      set_route_menu until @trains.route
      go_next_station_menu
    when '8'
      created_menu
    when '9'
      main_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      use_created_trains_menu
    end
  end

  def use_created_routes_menu
    puts 'What do you want to use?'
    puts 'Type 1, to add station to the route.'
    puts 'Type 2, to remove station from the route.'
    puts 'Type 3, to train menu.'
    puts 'Type 4, to previous menu.'
    puts 'Type 5, to main menu.'
    puts 'Type 0, to exit th program.'
    case input
    when '1'
      add_station_menu
    when '2'
      remove_station_menu
    when '3'
      use_created_trains_menu
    when '4'
      created_menu
    when '5'
      main_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      use_created_routes_menu
    end
  end

  def use_created_wagons_menu
    puts 'Type 1, to add or delete wagon from a train.'
    puts 'Type 2, to take a seat at passenger wagon.'
    puts 'Type 3, to take a volume in a cargo wagon.'
    puts 'Type 4, to previous menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      chose_train_menu
      use_created_trains_menu
    when '2'
      pass_wagons_list
      chose_wagon('passenger')
      take_seat_at_chosen_wagon
    when '3'
      cargo_wagons_list
      chose_wagon('cargo')
      take_volume_at_chosen_wagon
    when '4'
      created_menu
    when '0'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      use_created_wagons_menu
    end
  end

  def create_train_menu
    puts 'What train do you need?'
    puts 'Type 1, to create a passenger train.'
    puts 'Type 2, to create a cargo train.'
    puts 'Type 3, to previous menu.'
    puts 'Type 4, to main menu.'
    case input
    when '1'
      create_pass_train
    when '2'
      create_cargo_train
    when '3'
      create_menu
    when '4'
      main_menu
    else
      puts 'Wrong input! Try again!'
    end
  end

  def chose_train_menu
    puts 'Type 1, to choose passenger train.'
    puts 'Type 2, to choose cargo train.'
    puts 'Type 3, to main menu.'
    puts 'Type 0, to exit the program.'
    case input
    when '1'
      pass_trains_list
      chose_train('passenger')
    when '2'
      cargo_trains_list
      chose_train('cargo')
    when '3'
      main_menu
    when '0'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      chose_train_menu
    end
  end

  def create_wagon_menu
    puts 'Type 1, to create passenger wagon.'
    puts 'Type 2, to create cargo wagon.'
    puts 'Type 3, to previous menu.'
    puts 'Type 4, to main menu.'
    case input
    when '1'
      create_pass_wagon
    when '2'
      create_cargo_wagon
    when '3'
      create_menu
    when '4'
      main_menu
    else
      puts 'Wrong input! Try again!'
      create_wagon_menu
    end
  end

  def add_wagon_menu
    puts 'Type 1, to add passenger wagon.'
    puts 'Type 2, to add cargo wagon.'
    puts 'Type 3, to main menu.'
    puts 'Type 4, to previous menu.'
    puts 'Type 0, to exit.'
    case input
    when '1'
      pass_wagons_list
      chose_wagon('pass')
      add_chosen_wagon
    when '2'
      cargo_wagons_list
      chose_wagon('cargo')
      add_chosen_wagon
    when '3'
      main_menu
    when '4'
      use_created_trains_menu
    when '0'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
    end
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
      input until valid_input?(@stations) && @stations[@input.to_i - 1] != departure
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
      puts "The route #{@routes[@input.to_i - 1]} was set to the train #{@trains.number}"
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
    elsif @speed > 0
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
      used_route_index = @input.to_i - 1
      puts 'Chose station:'
      stations_list
      input
      input until valid_input?(@stations)
      used_station_index = @input.to_i - 1
      @routes[used_route_index].add_transit_point(@stations[used_station_index]) until @routes[used_route_index].stations.include?(@stations[used_station_index])
      puts "Station #{@stations[@input.to_i - 1].name} added to the chosen route."
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
      used_route_index = @input.to_i - 1
      if @routes[used_route_index].stations.size == 2
        puts 'Route must contents at least 2 stations!'
        puts "You can't delete station, anymore."
      else
        puts 'Chose station:'
        route_stations_list
        input
        input until valid_input?(@stations)
        @routes[used_route_index].del_transit_point(@stations[@input.to_i - 1]) while @routes.include?(@stations[@input.to_i])
        puts "Station #{@stations[@input.to_i - 1].name} deleted from the chosen route."
      end
    end
  end

  def go_next_station_menu
    @trains.move_forward
    puts "Train #{@trains.number} now on the #{@trains.current_station.name} station."
  rescue StandardError => e
    puts e.message
  end

  def go_previous_station_menu
    @trains.move_backward
    puts "Train #{@trains.number} now on the #{@trains.current_station.name} station."
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
    @input.to_i > 0 && @input.to_i <= arr.size
  end

  def stations_list
    puts 'Stations:'
    @stations.each { |station| puts "#{@stations.index(station) + 1}: #{station.name}" }
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
    @trains.wagons.each { |wagon| puts "#{@trains.wagons.index(wagon) + 1}: #{wagon.number}" }
  rescue StandardError
    puts 'You must create some wagon!'
  end

  def route_stations_list
    puts 'Stations of the current route:'
    @routes[@input.to_i - 1].each { |station| puts "#{@routes[@input.to_i - 1].index(station) + 1}: #{station.name}" }
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
        puts @stations[station_number - 1].show_trains_on_station_by_type('pass').each.number
        puts 'Cargo trains on station:'
        puts @stations[station_number - 1].show_trains_on_station_by_type('cargo').each.number
      end
    end
  end
end
