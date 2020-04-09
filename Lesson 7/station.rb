# Station_class

require_relative 'instance_counter'
require_relative 'validate'

class Station
  include Validate
  include InstanceCounter

  attr_reader :trains, :name
  def initialize(name)
    @name = name
    validate!
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
    @trains.select { |train| train.type == by_type }
  end

  def each_train
    @trains.map { |train| yield train}
  end

  def to_s
    @trains.each { |train| puts " #{name} station: #{train.number}, #{train.type} " }
  end

  private

  def validate!
    validate_name!
    validate_format!
    validate_number!
  end
end