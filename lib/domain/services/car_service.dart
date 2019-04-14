import 'package:flutter_cars/domain/car.dart';

class CarService {
  static List<Car> getCars() {
    final cars = List.generate(50, (index) {
      final String urlGoogle = 'http://cdn.24.co.za/files/Cms/General/d/8433/e8f901c7ee414966b59d7d2572c6362a.jpg';
      final String urlStandard = 'http://livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png';
      return Car('Ferrari $index', urlGoogle);
    });
    return cars;
  }
}
