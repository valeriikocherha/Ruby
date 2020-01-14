require_relative 'manufacturer'
require_relative 'valid'

class Carriage
  include Manufacturer
  include Valid
  
  attr_reader :number

  def initialize(number)
    @number = number
    validate!
  end

  protected

  def validate!
    raise 'Введите номер' if number.nil?
    raise 'Длина должна быть не меньше 5 символов' if number.lenght < 5
  end
end
