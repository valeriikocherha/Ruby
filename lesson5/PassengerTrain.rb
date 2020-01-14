class PassengerCar < Car
end

class PassengerTrain < Train

  def initialize(number)
    type = 'passanger'
     car_count = 0
    super(number, 'passenger', car_count)
  end

  def add_car(car)
    if car.instance_of?(PassengerCar)
      super(car)
    else
      puts "До пасажирського потягу можно причепати тлише пассажирские вагони"
    end
  end
end
