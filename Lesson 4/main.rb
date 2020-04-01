#Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
# - Создавать станции
# - Создавать поезда
# - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
# - Назначать маршрут поезду
# - Добавлять вагоны к поезду
# - Отцеплять вагоны от поезда
# - Перемещать поезд по маршруту вперед и назад
# - Просматривать список станций и список поездов на станции

require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'


class Menu

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @pass_trains = []
    @cargo_trains = []
    @pass_wagons = []
    @cargo_wagons = []
  end

  def start
    puts 'Welcome to RailWay!'
    main_menu
  end

  def main_menu
    puts 'Please choose what do you want to do:'
    puts 'Type 1, to create station, route for train or add/remove wagons from train'
    puts 'Type 2, to use created stations, routes, wagons'
    puts 'Type 3, to look at created stations, routes, wagons'
    puts 'Type exit, to exit the program'
    case input
    when '1'
      create_menu
    when '2'
      created_menu
    when '3'
      watch_menu
    when 'exit'
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
    puts 'Type Exit, to exit the program.'
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
    when 'exit'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      create_menu
    end
  end

  def created_menu
    puts 'What do you want to use?'
    puts 'Type 1, to use created trains.'
    puts 'Type 2, to use created routes.'
    puts 'Type 3, to use created wagons.'
    puts 'Type 4, to go to the main menu'
    puts 'Type "exit", to exit the program.'
    case input
    when '1'
      use_created_trains
    when '2'
      use_created_routes
    when '3'
      use_created_wagons
    when '4'
      main_menu
    when 'exit'
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
    puts 'Type 5, to look at wagons attached to train'
    puts 'Type 6, to go the main menu'
    puts 'Type "exit", to exit the program.'
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
    when 'exit'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      watch_menu
    end
  end

  def create_station_menu
    puts "Enter: station's name."
    input
    @stations << Station.new(@input)
    puts "Station #{@input} was created."
  end

  def create_route_menu
    if @stations.size < 2
      puts 'Need departure and destination stations at least!'
      create_station_menu
    else
      stations_list
      puts 'Type number of departure station:'
      input
      input until valid_input?(@stations)
      departure = @stations[@input.to_i - 1]
      puts 'Type number of destination station:'
      input until valid_input?(@stations) && @stations[@input.to_i - 1] != departure
      destination = @stations[@input.to_i - 1]
      @routes ||= Array.new
      @routes << Route.new(departure, destination)
      puts 'New route was created.'
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

  def create_pass_train
    puts 'Please, type train number:'
    input
    @trains ||= Array.new
    @pass_trains << PassengerTrain
    puts "Passenger train #{@input} was created!"
  end

  def create_cargo_train
    puts 'Please, type train number:'
    input
    @trains ||= Array.new
    @cargo_trains << CargoTrain
    puts "Cargo train #{@input} was created!"
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
    end
  end

  def create_pass_wagon
    puts 'Type number of passenger wagon:'
    input
    @wagons ||= Array.new
    @pass_wagons << PassengerWagon
    puts "Passenger wagon #{@input} was created!"
  end

  def create_cargo_wagon
    puts 'Type number of cargo wagon:'
    input
    @wagons ||= Array.new
    @cargo_wagons << CargoWagon
    puts "Passenger wagon #{@input} was created!"
  end

  def use_created_trains
    puts 'What do you want to do?'
    puts 'Type 1, to create a route for a train.'
    puts 'Type 2, to attach a wagon to the train.'
    puts 'Type 3, to remove a wagon from a train.'
    puts 'Type 4, to go to the previous station.'
    puts 'Type 5, to go to the next station.'
    puts 'Type 6, to the previous menu.'
    puts 'Type 7, to the main menu.'
    puts 'Type "exit", to exit'
    case input
    when '1'
      set_route_menu
    when '2'
      add_wagon_menu
    when '3'
      remove_wagon_menu
    when '4'
      go_previous_station_menu
    when '5'
      go_next_station_menu
    when '6'
      created_menu
    when '7'
      main_menu
    when 'exit'
      exit(0)
    end
  end

  def set_route_menu

  end

  def add_wagon_menu

  end

  def remove_wagon_menu

  end

  def use_created_routes
    puts 'What do you want to use?'
    puts 'Type 1, to add station to the route.'
    puts 'Type 2, to remove station from the route.'
    puts 'Type 3, to train menu.'
    puts 'Type 4, to previous menu.'
    puts 'Type 5, to main menu.'
    puts 'Type "exit", to exit.'
    case input
    when '1'
      add_station_menu
    when '2'
      remove_station_menu
    when '3'
      use_created_trains
    when '4'
      created_menu
    when '5'
      main_menu
    when 'exit'
      exit(0)
    end
  end

  def add_station_menu

  end

  def remove_station_menu

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
  end

  def routes_list
    puts 'Routes:'
    @routes.each { |route| puts "#{@routes.index(route) + 1}: #{route.to_s}" }
  end

  def trains_list
    puts 'Trains:'
    @trains.each { |train| puts "#{train.train_num} - #{train.train_type}" }
  end

  def pass_trains_list
    puts 'Passenger trains:'
    @pass_trains = @trains.select { |train| train.train_type == 'pass' }
    @pass_trains.each { |train| puts "#{train.train_num}" }
  end

  def cargo_trains_list
    puts 'Cargo trains:'
    @cargo_trains = @trains.select { |train| train.train_type == 'cargo' }
    @cargo_trains.each { |train| puts "#{train.train_num}" }
  end

  def pass_wagons_list
    puts 'Passenger wagons:'
    @pass_wagons = @wagons.select { |wagon| wagon.type == 'pass'}
    @pass_wagons.each { |wagon| puts "#{wagon.number}" }
  end

  def cargo_wagons_list
    puts 'Cargo wagons:'
    @cargo_wagons = @wagons.select { |wagon| wagon.type == 'cargo'}
    @cargo_wagons.each { |wagon| puts "#{wagon.number}" }
  end

  def train_wagons_list
    puts "Wagons of the train #{@trains.train_num}"
    @trains.wagons.each { |wagon| puts "#{@trains.wagons.index(wagon) + 1}: #{wagon.number}"}
  end

  def route_stations_list
    puts "Stations of the current route:"
    @routes[@input.to_i - 1].each { |station| puts "#{@routes[@input.to_i - 1].index(station) + 1}: #{station.name}"}
  end

  def current_station_trains_list

  end

  def go_next_station_menu
    @trains.move_forward
    puts "Train #{@trains.train_num} now on the #{@trains.current_station.name} station."
  end

  def go_previous_station_menu
    @trains.move_backward
    puts "Train #{@trains.train_num} now on the #{@trains.current_station.name} station."
  end

end

Menu.new.start