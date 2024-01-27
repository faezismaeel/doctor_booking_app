import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<DoctorsModel>> doctorsNotifier = ValueNotifier([]);
ValueNotifier<List<DrAppointment>> scheduleNotifier = ValueNotifier([]);

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


Future<void> addSchedule(DrAppointment value) async {
  final schedule = await Hive.openBox<Appoinments>('schedule');
  await schedule.put(
      value.id,
      Appoinments(
          date: value.date, time: value.time, drId: value.drId, id: value.id));
  scheduleNotifier.value.add(value);
  scheduleNotifier.notifyListeners();
}

Future<List<Appoinments>> getSchedule() async {
  final schedule = await Hive.openBox<Appoinments>('schedule');
  final doctors = await Hive.openBox<DoctorsModel>('doctors');

      // print(schedule.values.map((e) => e.date));
        List<DrAppointment> res=[];
  for (Appoinments appoinment in schedule.values) {
    print(appoinment.date);
    final myDoctor = doctors.values
        .where((element) => element.id == appoinment.drId)
        .toList();
    if (myDoctor.isNotEmpty) {
      final dr = myDoctor.first;
      res.add(DrAppointment(
                about: dr.about,
                date: appoinment.date,
                drId: dr.id,
                drname: dr.drname,
                id: appoinment.id,
                image: dr.image,
                rating: dr.rating,
                subtitle: dr.subtitle,
                time: appoinment.time,
              ));
    }
  }

    scheduleNotifier.value=res;
    scheduleNotifier.notifyListeners();

  return schedule.values.toList();
}

Future<void> editSchedule(Appoinments value) async {
  final schedule = await Hive.openBox<Appoinments>('schedule');
  await schedule.put(value.id, value);
getSchedule();
}

Future<void> deleteSchedule(int id) async {
  final schedule = await Hive.openBox<Appoinments>('schedule');
  await schedule.delete(id);
  getSchedule();
}
