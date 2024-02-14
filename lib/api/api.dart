import 'dart:convert';
import 'package:swara_solution_flutter_machine_test/api/base_url.dart';
import 'package:swara_solution_flutter_machine_test/model/login_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<LoginResponse?> login(String username, String password) async {
    var formData = {
      'username': username,
      'password': password,
      'grant_type': 'password',
    };

    var headers = {
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
    };

    final response = await http.post(Uri.parse(BaseUrl().baseUrl),
        body: formData, headers: headers);
    try {
      if (response.statusCode == 200) {
        var data = response.body;
        return LoginResponse?.fromJson(json.decode(data));
      } else {
        var data = response.body;
        return LoginResponse?.fromJson(json.decode(data));
      }
    } catch (e) {
      return null;
    }
  }
}
