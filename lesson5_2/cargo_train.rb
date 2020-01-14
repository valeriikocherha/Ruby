require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
  end

  def add_carriage(carriage)
    if carriage.instance_of?(CargoCarriage)
      super(carriage)
    else
      puts 'Можно добавлять только грузовые вагоны'
    end
  end
end
