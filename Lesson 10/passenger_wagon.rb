# frozen_string_literal: true

require_relative 'validate'

class PassengerWagon < Wagon
  include Validate
  attr_accessor :free_seats, :taken_seats, :seats

  def initialize(number, seats)
    super(number)
    @seats = seats
    @free_seats = @seats
    @taken_seats = @seats - @free_seats
    validate!
  end

  def type
    @type = 'passenger'
  end

  def take_seat
    validate_free_seats!
    @free_seats -= 1
  end

  private

  def validate!
    validate_seats!
  end
end
