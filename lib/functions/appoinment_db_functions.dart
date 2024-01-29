import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<DrAppointment>> scheduleNotifier = ValueNotifier([]);




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



Future<List<UserModel>> currentUser() async{
  final user = await Hive.openBox<UserModel>('user');

  for(UserModel loggedUser in user.values){
    final myUser = user.values
    .where((element) => element.id == loggedUser.id).toList();
    if(myUser.isNotEmpty){
      print(myUser);
    }
  }return user.values.toList();
}
