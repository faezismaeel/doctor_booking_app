import 'package:book_your_doctor/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<UserModel>> userNotifier = ValueNotifier([]);

Future<void> addUser(UserModel value) async {
  final user = await Hive.openBox<UserModel>('user'); 
  await user.put(value.id, value);
  print(user);
  userNotifier.value.add(value);
  userNotifier.notifyListeners();
}

Future<List<UserModel>> getUsers() async {
  final user = await Hive.openBox<UserModel>('user');
  userNotifier.value = user.values.toList();
  userNotifier.notifyListeners();
  return user.values.toList();
}
