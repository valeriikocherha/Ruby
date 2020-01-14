require_relative 'train'

class PassangerTrain < Train
  attr_reader :number

  def initialize(number)
    super(number, 'passanger')
  end

  def add_carriage(carriage)
    if carriage.instance_of?(PassangerCarriage)
      super(carriage)
    else
      puts 'Можно добавлять только пассажирские вагоны'
    end
  end
end
