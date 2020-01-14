require_relative 'class_Station'
require_relative 'class_Route'
require_relative 'class_Train'


station = Station.new('Politech')
puts station
station.get_train('excces', 'pass')
station.get_train('qwerty', 'freight')
station.get_train('auto', 'pass')
station.all_trains
station.show_trains
station.send_trains('auto', 'pass')
station.show_trains

route = Route.new('Lisova', 'Academic_town')
route.add_station('Politech')
route.add_station('Kreschatic')
route.add_station('Chernihivska')
route.show_stations
route.remove_station('Chernihivska')
route.show_stations

train = Train.new(1, "pass", 18)
train.car_count
train.instant_speed
train.accelerate
train.stop
train.add_car
train.remove_car
route = Route.new('Lisova', 'Academic_town')
route.add_station('Politech')
train.take_route(route)
train.go_to('Lisova')
train.station_around
