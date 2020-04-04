# Station_class
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @@all ||=Array.new
    @@all << self
  end

  def self.all
    @@all
  end

  def arrive_train(train)
    @trains ||= Array.new
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def show_trains_on_station_by_type(by_type)
    @trains.select { |train| train.train_type == by_type }
  end

  def to_s
    @trains.each { |train| puts " #{name} station: #{train.train_num}, #{train.train_type} " }
  end
end