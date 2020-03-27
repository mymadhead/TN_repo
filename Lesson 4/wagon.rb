class Wagon
  attr_reader :wagon_type, :train_num
  def initialize(train_num)
    @train_num = train_num
  end
end