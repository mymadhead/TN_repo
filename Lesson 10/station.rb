# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include Validation
  include InstanceCounter

  attr_reader :trains, :name
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @all ||= []
    @all << self
    register_instance
  end

  def self.all
    @@all
  end

  def arrive_train(train)
    @trains ||= []
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def trains_by_type(by_type)
    @trains.select { |train| train.type == by_type }
  end

  def each_train
    @trains.map { |train| yield train }
  end

  def to_s
    each_train do |train|
      puts "Number: #{train.number}"\
           "type: #{train.type}"\
           "wagons: #{train.number_of_wagons}"
    end
  end
end
