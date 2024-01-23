import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
part 'appoinments_model.g.dart';

@HiveType(typeId: 1)
class Appoinments{

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? drname;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  String? time;

  @HiveField(4)
  String? image;

  @HiveField(5)
  int? rating;

  Appoinments({required this.date,required this.time,required this.drname,required this.image,required this.id});

  factory Appoinments.fromJson(Map<dynamic, dynamic> json) => Appoinments(
        drname: json["drname"],
        date: json["date"],
        time: json["time"],
        image: json["image"],
        id: json["id"]
        
    );

}

Future<List> readJsonData() async {
  final jsondata = await rootBundle.loadString('assets/json_data/name.json');
  final  list =json.decode(jsondata);
  final res = list.map((e) => Appoinments.fromJson(e)).toList();
  return res;
}