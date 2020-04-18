# frozen_string_literal: true

module Validate
  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i.freeze
  NAME_FORMAT = /^[A-Z][a-z]+$/.freeze

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  def validate_number!
    return if !number.empty? || number.length >= 5

    raise 'Number cannot be empty! It must contains numbers!'
  end

  def validate_type!
    return unless wagons.type == type

    raise 'Invalid type of train! Choose another wagon or train.'
  end

  def validate_name!
    return if  name !~ NUMBER_FORMAT

    raise 'Name format: start with capital letter than downcase letters.'
  end

  def validate_route!
    raise 'Route should has at least two stations!' if @stations.count < 2
  end

  def validate_format!
    return if number !~ NUMBER_FORMAT

    raise 'Character format is incorrect! Try again!'
  end

  def validate_speed!
    raise 'Speed must be at 0 to 190 km/h!' unless (0..190).include?(speed)
  end

  def validate_wagon_type!
    return if wagons.type == type

    raise 'Wagon type is incorrect! Take another wagon type or train!'
  end

  def validate_seats!
    return if @seats.positive? && @seats.is_a?(Wagon)

    raise 'Number of seats should be an integer and more than 0'
  end

  def validate_free_seats!
    return unless @free_seats.zero?

    raise 'In this wagon no free seats! Choose another wagon.'
  end

  def validate_volume!
    raise 'Volume must be more than 0!' unless @volume != 0
  end

  def validate_free_volume!
    return unless @free_volume.zero? && value > @free_volume

    raise 'In this wagon no free volume! Choose another wagon.'
  end
end
