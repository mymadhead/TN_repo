require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'wagon'

class Menu

  def initialize
    @stations = []
    @routes = []
    @pass_train = []
    @cargo_train = []
    @pass_wagon = []
    @cargo_wagon = []
  end

  def start
    puts 'Welcome to RailWay!'
    menu
  end

  def menu
    puts 'Please choose what do you want to do:'
    puts 'Type 1, to create station, route for train or add/remove wagons from train'
    puts 'Type 2, to use created stations, rotes, wagons'
    puts 'Type 3, to look at created stations, rotes, wagons'
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

  end

  def menu_2

  end

  def menu_3

  end

  def input
    @input = gets.chomp.downcase
  end


end
