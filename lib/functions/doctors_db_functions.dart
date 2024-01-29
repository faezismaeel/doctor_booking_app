import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DoctorsModel>> doctorsNotifier = ValueNotifier([]);

Future<void> addDoctor(DoctorsModel value) async {
  final doctors = await Hive.openBox<DoctorsModel>('doctors');
  final _id = await doctors.put(value.id, value);
  doctorsNotifier.value.add(value);
  doctorsNotifier.notifyListeners();
}

Future<List<DoctorsModel>> getDoctors() async {
  final doctors = await Hive.openBox<DoctorsModel>('doctors');
  doctorsNotifier.value = doctors.values.toList();
  doctorsNotifier.notifyListeners();
  return doctors.values.toList();
}

Future<void> editDoctor(DoctorsModel value) async {
  final doctors = await Hive.openBox<DoctorsModel>('doctors');
  doctors.put(value.id, value); 
}