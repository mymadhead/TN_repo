# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :departure, :destination, :transit_stations, :route_name
  validate :departure, :uniqness, :destination

  def initialize(departure, destination)
    @stations = [departure, destination]
    validate!
    @transit_stations = []
    @route_name = "#{departure.name}->#{destination.name}"
    register_instance
  end

  def add_transit_station(station)
    @transit_stations << station
  end

  def del_transit_station(station)
    @transit_stations.delete(station)
  end

  def route_stations
    [departure] + @transit_stations + [destination]
  end

  def to_s
    puts "Current route: #{departure.name}->#{destination.name}"
  end
end
