# frozen_string_literal: true

require_relative 'interface'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'seed'
require_relative 'manufacturer'
require_relative 'validation'
require_relative 'instance_counter'

menu = Interface.new

loop do
  menu.menu_choice
end
