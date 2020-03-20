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
    @trains.each { |train| puts "#{self.name} station: #{train.train_num}, #{train.type}" }
  end

  def trains_by_type(by_type)
    @trains.select { |train| train.type == by_type }
  end

  def cargo_train
    @trains.select { |train| train.type == 'cargo'}
  end

  def passenger_train
    @trains.select { |train| train.type == 'passenger'}
  end

end
