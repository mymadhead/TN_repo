# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  attr_reader :train_num, :train_type, :train_length, :train_speed, :current_station

  def initialize(train_num, train_type, train_length)
  @train_num = train_num
  @train_type = train_type
  @train_length = train_length
  @train_speed = 0
  end

  def speed_up(train_speed)
    @train_speed = train_speed
    train_speed + 1
  end

  def speed_down(train_speed)
    @train_speed = train_speed
    train_speed - 1
  end

  def train_stop
    train_speed == 0
  end

  def add_vgn
    if train_stop do
      @train_length += 1
    end
    end
  end

  def delete_vgn
    if train_stop do
      @train_length -= 1
    end
    end
    end

  def move_forward
    change_current_station(next_station_name)
  end

  def move_back
    change_current_station(previous_station_name)
  end

  def next_station
    @route.route_points[next_station_name]
  end

  def previous_station
    @route.route_points[previous_station_name]
  end

  def route=(route)
    @route = route
    change_current_station(0)
  end

  def change_current_station(name)
    @current_station.depart_train(self) if defined?(@current_station)
    @current_station = @route.route_points[name]
    @current_station.arrive_train(self)
    @current_station_name = name
  end

  def next_station_name
    @current_station_name + 1
  end

  def previous_station_name
    @current_station_name - 1
  end


end

