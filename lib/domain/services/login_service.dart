import 'dart:convert';

import 'package:flutter_cars/domain/response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Response> login(String email, String password) async {
    String url = 'http://livrowebservices.com.br/rest/login';

    final response =
        await http.post(url, body: {'login': email, 'senha': password});

    return Response.fromJson(json.decode(response.body));
  }
}
