# frozen_string_literal: true

class CargoTrain < Train
  attr_reader :type
  def initialize(number)
    super(number)
    @type = 'cargo'
  end

  def wagons_to_s
    each_wagon do |wagon|
      puts "Wagon:#{wagon.number} type: #{wagon.type}" \
           "free volume: #{wagon.free_volume}" \
           "taken volume: #{wagon.taken_volume}"
    end
  end
end
