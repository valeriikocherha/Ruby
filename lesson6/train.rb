require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'valid'

class Train
  include Manufacturer
  include InstanceCounter
  include Valid

  attr_reader :speed, :number, :type

  @@trains = {}
  NUMBER_FORMAT = /^[a-z\d]{3}-*[a-z\d]{2}$/i

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    validate!
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
    @carriages << carriage if speed.zero?
  end

  def remove_carriage(carriage)
      @carriages.delete(carriage) if @carriages.include?(carriage) && speed.zero?
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
    end
  end

  def go_back
    if previous_station
      current_station.send_train(self)
      @station_index -= 1
      current_station.take_train(self)
      end
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
      @route.stations[@station_index + 1] if current_station != @route.last_station
  end

  def previous_station
      @route.stations[@station_index - 1] if current_station != @route.first_station
  end

  protected

  def validate!
    raise 'Введите номер' if number.nil?
    raise 'Введите тип' if type.nil?
    raise 'Неправильный формат номера' if number !~ NUMBER_FORMAT
  end

end
