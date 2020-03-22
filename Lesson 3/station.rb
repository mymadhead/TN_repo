# Station_class
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
class Station
  attr_reader :trains, :name, :train_num
  def initialize(name, trains)
    @name = name
    @trains = trains
    @train_num = []
    @trains = []
  end

  def arrive_train(train)
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def to_s
    @trains.each { |train| puts "#{self.name} station: #{train.train_num}, #{train.train_type}" }
  end

  def trains_by_type(by_type)
    @trains.select { |train| train.train_type == by_type }
  end

  def cargo_trains
    @trains.select { |train| train.train_type == 'cargo train'}
  end

  def passenger_trains
    @trains.select { |train| train.train_type == 'passenger_train'}
  end
end