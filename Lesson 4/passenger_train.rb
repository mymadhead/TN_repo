class PassengerTrain < Train
  def initialize(train_num)
    super
    @train_type = 'passenger train'
  end
end