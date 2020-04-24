# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation

  attr_reader :type, :number

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
end
