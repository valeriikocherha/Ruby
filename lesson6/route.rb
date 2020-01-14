require_relative 'instance_counter'
require_relative 'valid'

class Route
  include InstanceCounter
  include Valid
  attr_reader :stations, :number

  def initialize(number, first_station, last_station)
    @stations = [first_station, last_station]
    @number = number
    validate!
    register_instance
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def stations_all
    @stations.each { |train| puts train.name }
  end

  def delete_station(station)
    if [@stations.first, @stations.last].include?(station)
      puts 'Невозможно удалить начальну/конечную станцию'
    else
      @stations.delete(station)
    end
  end

  protected

  def validate!
    raise 'Введите номер' if number.nil?
    raise 'Длина должна быть не меньше 5 символов' if number.lenght < 5
    raise 'Начальная станция не существует' if first_station.instance_of?
    raise 'Конечная станция не существует' if last_station.instance_of?
    raise 'Начальная и конечная не должны совпадать!' if first_station == last_station
  end
end
