# Class Route
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
require_relative 'instance_counter'
require_relative 'validate'

class Route
  include InstanceCounter
  include Validate

  attr_reader :departure, :destination
  def initialize(departure, destination)
    register_instance
    @departure = departure
    @destination = destination
    @transit_point = []
    validate!
  end

  def add_transit_point(point)
    @transit_point << point
  end

  def del_transit_point(point)
    @transit_point.delete(point)
  end

  def route_stations
    [departure] + @transit_point + [destination]
  end

  def to_s
    puts "Current route: #{departure.name}->#{destination.name}"
  end

  def validate!
    validate_name!
    validate_route!
    validate_format!
  end
end

