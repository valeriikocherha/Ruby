require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :speed, :number, :type

  @@trains = {}

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    register_instance
    @@trains[number] = self
  end

  def self.find(number)
    @@trains[number]
  end

  def go
    @speed += 1
  end

  def slow_down
    @speed -= 1 if speed != 0
  end

  def add_carriage(carriage)
    @carriages = []
    if speed.zero?
      @carriages << carriage
    else
      puts 'Нельзя прицепить вагон'
     end
  end

  def remove_carriage(carriage)
    if @carriages.include?(carriage) && speed == 0
      @carriages.delete(carriage)
    else
      puts 'Нельзя отцепить вагон'
    end
  end

  def route_for_train(route)
    @route = route
    go_to_route
  end

  def go_to_route
    @station_index = 0
    current_station.take_train(self)
  end

  def go_forward
    if next_station
      current_station.send_train(self)
      @station_index += 1
      current_station.take_train(self)
    else
      puts 'Движение вперед невозможно'
    end
  end

  def go_back
    if previous_station
      current_station.send_train(self)
      @station_index -= 1
      current_station.take_train(self)
    else
      puts 'Движение назад невозможно'
    end
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    if current_station != @route.last_station
      @route.stations[@station_index + 1]
    else
      puts 'Это последняя станция'
    end
  end

  def previous_station
    if current_station != @route.first_station
      @route.stations[@station_index - 1]
    else
      puts 'Это первая станция'
    end
  end
end
