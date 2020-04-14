module Validate
  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i.freeze
  NAME_FORMAT = /^[A-Z][a-z]+$/.freeze

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate_number!
    raise 'Number cannot be empty! It must contains numbers!' if number.empty? && number.length < 5
  end

  def validate_type!
    return if type == type
    raise 'Invalid type of train! Choose another wagon or train.'
  end

  def validate_name!
    raise 'Name cannot be empty. It must contains letters!' if name.empty? && name !~ NAME_FORMAT
  end

  def validate_route!
    raise 'Route cannot be empty. It must contains two stations at least!' if route.empty?
  end

  def validate_format!
    raise 'Character format is incorrect! Try again!' if number !~ NUMBER_FORMAT
  end

  def validate_speed!
    raise 'Speed must be at 0 to 190 km/h!' unless (0..190).include?(speed)
  end

  def validate_wagon_type!
    raise 'Wagon type is incorrect! Take another wagon type or train!' unless type == self.type
  end

  def validate_seats!
    raise 'Number of seats should be an integer and more than 0' unless @seats > 0 && @seats.is_a?;Integer
  end

  def validate_free_seats!
    raise 'In this wagon no free seats! Choose another wagon.' if @free_seats.zero?
  end

  def validate_volume!
    raise 'Volume must be more than 0!' unless @volume != 0
  end

  def validate_free_volume!
    raise 'In this wagon no free volume! Choose another wagon.' if @free_volume == 0 && value > @free_volume
  end
  end