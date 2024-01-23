import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Appoinments>> scheduleNotifier =ValueNotifier([]);

Future<void> addSchedule(Appoinments value) async {
final schedule = await Hive.openBox<Appoinments>('schedule');
final _id = await schedule.put(value.id,value);

print(schedule);
  scheduleNotifier.value.add(value);
  scheduleNotifier.notifyListeners();
}

Future<List<Appoinments>> getSchedule() async{
  final schedule = await Hive.openBox<Appoinments>('schedule');
  
  scheduleNotifier.value = schedule.values.toList();
  // scheduleNotifier.value.clear();
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
  print(schedule.get(id));
  await schedule.delete(id);
  getSchedule();

}
