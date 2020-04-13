class PassengerTrain < Train
  def initialize(number, type = :passenger)
    @type = type
  end
end