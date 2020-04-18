# frozen_string_literal: true

require_relative 'validation'

class CargoWagon < Wagon
  include Validation
  attr_accessor :free_volume, :taken_volume

  def initialize(number, volume)
    super(number)
    @volume = volume
    @free_volume = @volume
    @taken_volume = @volume - @free_volume
    validate!
  end

  def type
    @type = 'cargo'
  end

  def take_volume(value)
    validate_free_volume!
    @free_volume -= value
  end

  private

  def validate!
    validate_volume!
  end
end
