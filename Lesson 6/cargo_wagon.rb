class CargoWagon
  def wagon_type(number, type = :cargo)
    @type = type
    super
  end
end