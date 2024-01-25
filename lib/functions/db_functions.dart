import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<DoctorsModel>> doctorsNotifier = ValueNotifier([]);
ValueNotifier<List<Appoinments>> scheduleNotifier =ValueNotifier([]);

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

Future<void> addSchedule(Appoinments value) async {
final schedule = await Hive.openBox<Appoinments>('schedule');
final _id = await schedule.put(value.id,value);
  scheduleNotifier.value.add(value);
  scheduleNotifier.notifyListeners();
}



Future<List<Appoinments>> getSchedule() async{
  final schedule = await Hive.openBox<Appoinments>('schedule');
  scheduleNotifier.value = schedule.values.toList();
  scheduleNotifier.notifyListeners();
  return schedule.values.toList();
  
}


Future<void> editSchedule(Appoinments value) async{
  final schedule = await Hive.openBox<Appoinments>('schedules');
  schedule.put(value.id, value);

}


Future<void> deleteSchedule(int id) async {
   final schedule = await Hive.openBox<Appoinments>('schedule');
  await schedule.delete(id);
  getSchedule();

}
