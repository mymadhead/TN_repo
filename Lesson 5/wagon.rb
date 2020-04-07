require_relative 'manufacturer'
require_relative 'validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :number

  def initialize(number)
    @number = number
    validate!
  end

  private

  def validate!
    validate_number!
    validate_format!
  end
end