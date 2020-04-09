# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута.
require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validate'

class Train
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_accessor :speed
  attr_reader :number, :wagons, :type

  def initialize(number)
    register_instance
    @number = number
    @speed = 0
    validate!
    @@all << self
  end

  def self.find(number)
    @@all.find { |train| train.number == number }
  end

  def speed_up
    @speed += 1
  end

  def speed_down
    @speed -= 1
  end

  def stop_train
    @speed.zero?
  end

  def add_wagon(wagon)
    stop_train
    validate_wagon_type!
    @wagons ||= []
    @wagons << wagon
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) if @speed.zero?
  end

  def assign_route(route)
    @route = route
    @route.departure.arrive_train(self)
    @current_route_index = 0
  end

  def current_station
    @route.route_stations.detect { |station| station.trains.include?(self) }
  end

  def move_forward
    return unless can_move_forward?
    current_station_index = @route.route_stations.index(current_station)
    leave_station
    @route.route_stations[current_station_index + 1].arrive_train(self)
  end

  def move_backward
    return unless can_move_backward?
    current_station_index = @route.route_stations.index(current_station)
    leave_station
    @route.route_stations[current_station_index - 1].arrive_train(self)
  end

  def can_move_forward?
  current_station == @route.departure
  end

  def can_move_backward?
  current_station == @route.destination
  end

  def leave_station
    current_station.depart_train(self)
  end

  def each_wagon
    @wagons.map { |wagon| yield wagon }
  end

  private

  def validate!
    validate_number!
    validate_type!
    validate_speed!
    validate_wagon_type!
    validate_format!
  end
end

