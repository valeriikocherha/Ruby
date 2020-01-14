class Route

  attr_accessor :stations, :from, :to

  def initialize(from, to)
    @from = from
    @to = to
    @stations = [from, to]
  end

  def add_station(station)
    @stations << station
    puts "До маршруту #{@from} --- #{@to} добавлена станція: #{station}"
  end

  def remove_station(station)
    if @from == station || @to == station
      puts "Кінцеві станції видалять не можна"
    else
      @stations.delete(station)
      puts "Станція #{station} видалена з маршруту #{@from} --- #{@to}"
    end
  end

  def show_stations
    puts "В маршрут входять станції:"
    @stations.each do |station|
      puts station
    end
  end
  
  def name
    stations.first.name + " - " + stations.last.name
  end

end
