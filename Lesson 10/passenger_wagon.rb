# frozen_string_literal: true

require_relative 'validation'

class PassengerWagon < Wagon
  include Validation
  attr_accessor :free_seats, :taken_seats, :seats

  def initialize(number, seats)
    super(number)
    @seats = seats
    @free_seats = @seats
    @taken_seats = @seats - @free_seats
  end

  def type
    @type = 'passenger'
  end

  def take_seat
    @free_seats -= 1
  end
end
