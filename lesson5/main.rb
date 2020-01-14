require_relative 'Station'
require_relative 'Route'
require_relative 'Train'
require_relative 'Car'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
require_relative 'Manufacturer'
require_relative 'InstanceCounter'

trains = []
CAR_TYPES = {'cargo' => CargoCar, 'passenger' => PassengerCar}


puts %Q(
0. Вихід
1. Створить станцію
2. Створить потяг
3. Підчепить вагон до потягу
4. Відчепить вагон від потягу
5. Помістить потяг на станцію
6. Переглянуть список станцій
7. Переглянуть список потягів на станції
)

loop do
  puts "Виберіть команду"
  choise = gets.chomp.to_i
  case choise
    #Вихід
  when 0
    puts "Бувайте, на все добре!!!"
    break

  #Створить станцію
  when 1
    puts "Введіть назву"
    name = gets.chomp
    stations << Station.new(name)
    puts " Створена станція #{name}"

  #Створить потяг
  when 2
    puts "Уведіть номер потягу"
    number = gets.chomp
    puts "1 - пасажирський, 2 - вантажний"
    choice = gets.chomp.to_i
    case choice
    when 1
      trains << PassengerTrain.new(number)
      puts "Створений пасажирський потяг №#{number}"
    when 2
      trains << CargoTrain.new(number)
      puts "Створений вантажний потяг №#{number}"
      else
        puts "Потяг не створений. Треба увести 1 чи 2"
      end


    #Підчепить вагон до потягу
  when 3
    if trains.empty?
      puts "Спочатку створіть потяг"
    else
      puts "До якого потягу підчепить?"
      number = gets.chomp
      train = trains.select{|train| train.number == number}.first
      if train.nil?
        puts "Потяга з таким номером не існує"
      elsif train.type == "cargo"
        train.add_car(CargoCar.new)
      elsif train.type == "passenger"
        train.add_car(PassangerCar.new)
      end
    end

    #Відчепить вагон від потягу
  when 4
    if trains.empty?
      puts "Спочатку створіть потяг"
    else
      puts "Уведіть номер потяга"
      number = gets.chomp
      train = trains.select{|train| train.number == number}.first
      if train.nil?
        puts "Потяга з таким номером не існує"
      elsif train.cars.empty?
        puts "У даного потяга немає вагонів"
      else
        train.remove_car(train.cars.last)
      end
    end

    #Помістить потяг на станцію
  when 5
    if trains.empty?
      puts "Спочатку створіть потяг"
    elsif stations.empty?
      puts "Спочатку створіть станцію"
    else
      puts "Уведіть номер потяга"
      number = gets.chomp
      train = trains.select{|train| train.number == number}.first
      if train.nil?
        puts "Потяга з таким номером не існує"
      else
        puts "На яку станцію?"
        name = gets.chomp
        station = stations.select{|station| station.name == name}.first
        if stations.nil?
          puts "Станції не існує"
        else
          stations.get_train(train)
        end
      end
    end

    #Переглянуть список станцій
  when 6
    puts "Список станцій: "
    stations.each do |station|
      puts "#{station.name}"
    end

    #Переглянуть список потягів на станції
  when 7
    if stations.empty?
      puts "Спочатку створіть станцію"
    else
      puts "На яку станцію?"
      name = gets.chomp
      station = stations.select{|station| station.name == name}.first
      if station.nil?
        puts "Такой станции нет"
      else
        station.show_trains
      end
    end
  else
    puts "Виберіть один із запропонованих варіантів"
  end
end
