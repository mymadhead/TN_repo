# frozen_string_literal: true

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

  def info
    if @type == :passenger
      puts "Wagon № #{@number}, type: #{@type}"\
            " free seats: #{@free_seats}"\
            " taken seats: #{@taken_seats}"
    elsif @type == :cargo
      puts "Wagon № #{@number}, type: #{@type}"\
           " free volume: #{@free_seats}"\
           "taken volume: #{@taken_seats}"
    end
  end

  private

  def validate!
    validate_number!
    validate_type!
    validate_format!
  end
end
