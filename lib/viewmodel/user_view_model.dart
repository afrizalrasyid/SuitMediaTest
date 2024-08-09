import 'package:flutter/material.dart';
import 'package:suitmediatest/model/user_model.dart';
import 'package:suitmediatest/model/api/user_api.dart';

class UserViewModel with ChangeNotifier {
  final List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final fetchedUsers = await UserAPI.getUser();
      _users.clear();
      _users.addAll(fetchedUsers);
      notifyListeners();
    } catch (e) {
      print("Error fetching users: $e");
    }
  }
}
