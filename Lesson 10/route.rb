# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :departure, :destination, :transit_stations, :route_name
  def initialize(departure, destination)
    @stations = [departure, destination]
    @transit_stations = []
    @route_name = "#{departure.name}->#{destination.name}"
    validate!
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

  private

  def validate!
    validate_route!
  end
end
