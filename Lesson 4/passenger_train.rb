class PassengerTrain < Train
  def initialize(train_type)
    super
    @train_type = :passenger
  end
end