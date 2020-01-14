class CargoCar < Car
end

class CargoTrain < Train

  def initialize(number)
    type = "cargo"
    car_count = 0
    super(number, "cargo", car_count)
  end

  def add_car(car)
    if car.instance_of?(CargoCar)
      super(car)
    else
      puts "К грузовому поезду можно прицеплять только грузовые вагоны"
    end
  end
end
