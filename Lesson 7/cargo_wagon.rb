require_relative 'validate'

class CargoWagon < Wagon
  include Validate
  attr_accessor :volume, :free_volume, :taken_volume

  def initialize(volume)
    @volume = volume
    @free_volume = @volume
    @taken_volume = @volume - @free_volume
    validate!
  end

  def wagon_type(number, type = :cargo)
    super
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