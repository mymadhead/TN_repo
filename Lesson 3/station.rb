# Station_class
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
class Station
  attr_reader :trains, :name
  def initialize(name, trains)
    @name = name
    @trains = trains
    @trains = []
  end

  def arrive_train(train)
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.train_type == type }
  end

  def to_s
    "Station: #{name}"
  end
end