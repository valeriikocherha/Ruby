require_relative 'instance_counter'
require_relative 'valid'

class Station
  include InstanceCounter
  include Valid
  attr_reader :name, :trains

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validate!
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

  protected

  def validate!
    raise 'Введите номер' if number.nil?
    raise 'Длина должна быть не меньше 5 символов' if number.lenght < 5
  end

end
