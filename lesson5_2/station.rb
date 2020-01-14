require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def take_train(train)
    @trains << train
  end

  def train_by_type(type)
    @trains.count { |train| type == train.type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def self.all
    @@stations
  end
end
