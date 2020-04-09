require_relative 'validate'

class PassengerWagon < Wagon
  include Validate
  attr_accessor :seats, :free_seats, :taken_seats

  def initialize(seats)
    @seats = seats
    @free_seats = @seats
    @taken_seats = @seats - @free_seats
    validate!
  end

  def wagon_type(number, type = :passenger)
    super
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