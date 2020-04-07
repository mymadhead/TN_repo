class CargoTrain < Train
  def initialize(number, type = :cargo)
    @type = type
  end
end