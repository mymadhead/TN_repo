# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super(number)
    @type = 'passenger'
  end

  def wagons_to_s
    each_wagon do |wagon|
      puts "Wagon: #{wagon.number}, type: #{wagon.type}"\
           "free seats: #{wagon.free_seats}"\
           "taken seats: #{wagon.taken_seats}"
    end
  end
end
