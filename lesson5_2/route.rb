require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations, :number

  def initialize(number, first_station, last_station)
    @stations = [first_station, last_station]
    @number = number
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
end
