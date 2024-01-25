import 'package:hive_flutter/hive_flutter.dart';
part 'doctors_model.g.dart';

@HiveType(typeId: 1)
class DoctorsModel{

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? drname;

  @HiveField(2)
  String? subtitle;

  @HiveField(3)
  String? image;

  @HiveField(4)
  String? about;

  @HiveField(5)
  String? rating;


  DoctorsModel({required this.id,required this.drname, required this.subtitle,required this.image,required this.about, required this.rating});

}
