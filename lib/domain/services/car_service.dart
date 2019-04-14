import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_cars/domain/car.dart';

class CarService {
  static Future<List<Car>> getCars() async {
    final url = 'http://livrowebservices.com.br/rest/carros';

    final response = await http.get(url);
    final mapCars = json.decode(response.body).cast<Map<String, dynamic>>();
    return mapCars.map<Car>((car) => Car.fromJson(car)).toList();
  }
}
