import 'package:suitmediatest/model/user_model.dart';
import 'package:dio/dio.dart';

class UserAPI {
  static Future<List<User>> getUser() async {
    final response =
        await Dio().get('https://reqres.in/api/users?page=1&per_page=10');
    List<User> users = (response.data['data'] as List)
        .map(
          (e) => User(
            id: e['id'],
            email: e['email'],
            firstName: e['first_name'],
            lastName: e['last_name'],
            avatar: e['avatar'],
          ),
        )
        .toList();
    return users;
  }
}
