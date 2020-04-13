class CargoTrain < Train
  def initialize(number)
    super(number)
    @type = 'cargo'
  end

  def wagons_to_s
    each_wagon do |wagon|
      puts "Wagon: #{wagon.number}, type: #{wagon.type}, free volume: #{wagon.free_volume}, taken volume: #{wagon.taken_volume}."
    end
  end
end