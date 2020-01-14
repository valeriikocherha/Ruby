class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :number, :car_count, :station, :route, :type
  @@trains = []

  def initialize(number, type, car_count)
    @number = number
    @type = type
    @car_count = car_count
    @speed = 0
    @@trains[number] = self
   register_instance
  end

  def self.find(number)
   @@trains[number]
 end

  def accelerate
    puts "Уведіть бажаний швидкісний режим"
    speed = gets.chomp
    @speed = speed
    puts "Ваша швидкість: #{@speed}"
  end

  def stop
   @speed = 0
  puts "Швидкість рівна #{@speed}"
end

  def station_around
    if route.nil?
      puts "Маршрут не заданий"
    else
      station_index = route.station.index(station)
      puts "Теперішня станція #{station}"
      if station_index != 0
        puts "Попередня станція #{route.stations[station_index - 1]}"
      end
      if station_index != route.stations.size - 1
        puts "Наступна станція #{route.stations[station_index + 1]}"
      end
    end
  end

  def add_car
    if @speed == 0
      self.cars << car
      @car_count += 1
      puts "До потяга #{@number} причепили вагон, їх кількість #{@car_count}"
    else
      puts "На ходу не можна причепляти вагони"
    end
  end 

  def remove_car
    if @car_count == 0
      puts "Вагони не підчеплені"
    elsif @speed == 0
      @car_count -= 1
      puts "Вагон відчеплено, кількість вагонів #{@car_count}"
    else
      puts "Для відчеплення вагонів ЗУПИНІТЬСЯ"
    end
  end

  def car_count
    puts "кількість вагонів у потязі #{@car_count}"
  end

  def take_route(route)
    @route = route
    puts "Потягу присвоєний маршрут #{@from} --- #{@to}"
  end
end
  def go_to(station)
   if route.nil?
    puts "Без маршруту потяг не може їхати"
  elsif route.stations.include?(station)
    @station = station
    station.get_train(self)
  else
    puts "Станція #{station} не входить до маршруту"
  end
end
