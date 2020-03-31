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
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'


class Menu

  def initialize
    @stations = []
    @routes = []
    @pass_trains = []
    @cargo_trains = []
    @pass_wagons = []
    @cargo_wagons = []
  end

  def start
    puts 'Welcome to RailWay!'
    menu
  end

  def menu
    puts 'Please choose what do you want to do:'
    puts 'Type 1, to create station, route for train or add/remove wagons from train'
    puts 'Type 2, to use created stations, routes, wagons'
    puts 'Type 3, to look at created stations, routes, wagons'
    puts 'Type exit, to exit the program'
    case input
    when '1'
      menu_1
    when '2'
      menu_2
    when '3'
      menu_3
    when 'exit'
      puts 'Good bye!'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      menu
    end
  end

  def menu_1
    puts 'What do you want to do?'
    puts 'Type 1 to create a station.'
    puts 'Type 2 to create a train.'
    puts 'Type 3 to create a route for train.'
    puts 'Type 4 to create a wagon.'
    puts 'Type 5 to go to the main menu'
    puts 'Type Exit, to exit the program'
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
      menu
    when 'exit'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      menu_1
    end
  end

  def menu_2
    puts 'What do you want to use?'
    puts 'Type 1 to use created stations.'
    puts 'Type 2 to use created trains.'
    puts 'Type 3 to use created routes.'
    puts 'Type 4 to use created wagons.'
    puts 'Type 5 to go to the main menu'
    puts 'Type exit, to exit the program.'
    case input
    when '1'
      use_created_stations
    when '2'
      use_created_trains
    when '3'
      use_created_routes
    when '4'
      use_created_wagons
    when '5'
      menu
    when 'exit'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      menu_2
    end
  end

  def menu_3
    puts 'What do you looking for?'
    puts 'Type 1 to look at created stations.'
    puts 'Type 2 to look at created trains.'
    puts 'Type 3 to look at created routes.'
    puts 'Type 4 to look at trains on current station.'
    puts 'Type 5 to look at wagons attached to train'
    puts 'Type 6 to go the main menu'
    puts 'Type exit, to exit the program.'
    case input
    when '1'
      stations_list
    when '2'
      trains_list
    when '3'
      routes_list
    when '4'
      current_station_trains
    when '5'
      pass_wagons_list
      cargo_wagons_list
    when '6'
      menu
    when 'exit'
      exit(0)
    else
      puts 'Wrong input! Try again!'
      menu_3
    end
  end

  def input
    @input = gets.chomp.downcase
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

  def create_station_menu
    puts "Enter: station's name."
    input
    @stations << Station.new(@input)
    puts "Station #{@input} was created."
  end

end

Menu.new.start