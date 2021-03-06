class Station
  include InstanceCounter
  @@stations = []
  
  attr_accessor :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def get_train(train,type)
    @trains << [train, type]
    puts "На станцію #{name} прибув потяг #{[train, type]}"
  end

  def all_trains
    trains.each do |train, type|
      puts "#{[train, type]}"
    end
  end

  def show_trains(type = 'pass' && 'freight')
    if type
      trains.each do |train, type|
        puts "На станції потяг: #{[train, type]}"
      end
    end
  end


  def send_trains(train, type)
    index = trains.find_index([train, type])
    trains.delete(train)
    trains[index] = nil
    puts "Станцію #{name} покинув потяг #{[train, type]}"
  end
end
