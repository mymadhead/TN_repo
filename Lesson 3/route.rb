# Class Route
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :departure, :destination, :route_name

  def initialize(departure, destination)
    @departure = departure
    @destination = destination
    @transit_point = []
    @route_name = "#{departure.name}->#{destination.name}"
  end

  def add_transit_point(point)
    @transit_point << point
  end

  def del_transit_point(point)
    @transit_point.delete(point)
  end

  def route_points
    [departure] + @transit_point + [destination]
  end

  def route_empty?
    @transit_point.empty?
  end

  def to_s
    "Маршрут: #{departure} - #{destination}"
  end
end