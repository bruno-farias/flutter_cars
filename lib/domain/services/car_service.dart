import 'package:flutter_cars/domain/car.dart';

class CarService {
  static List<Car> getCars() {
    final cars = List.generate(50, (index) {
      return Car('Ferrari $index',
          'http://livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png');
    });
    return cars;
  }
}
