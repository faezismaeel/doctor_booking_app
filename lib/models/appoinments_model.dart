import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'appoinments_model.g.dart';

@HiveType(typeId: 2)
class Appoinments {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? drId;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  String? time;
  Appoinments({
    this.id,
    this.drId,
    this.date,
    this.time,
  });


  Appoinments copyWith({
    int? id,
    int? drId,
    DateTime? date,
    String? time,
  }) {
    return Appoinments(
      id: id ?? this.id,
      drId: drId ?? this.drId,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(drId != null){
      result.addAll({'drId': drId});
    }
    if(date != null){
      result.addAll({'date': date!.millisecondsSinceEpoch});
    }
    if(time != null){
      result.addAll({'time': time});
    }
  
    return result;
  }

  factory Appoinments.fromMap(Map<String, dynamic> map) {
    return Appoinments(
      id: map['id']?.toInt(),
      drId: map['drId']?.toInt(),
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date']) : null,
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Appoinments.fromJson(String source) => Appoinments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appoinments(id: $id, drId: $drId, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Appoinments &&
      other.id == id &&
      other.drId == drId &&
      other.date == date &&
      other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      drId.hashCode ^
      date.hashCode ^
      time.hashCode;
  }
}

Future<List> readJsonData() async {
  final jsondata = await rootBundle.loadString('assets/json_data/name.json');
  final list = json.decode(jsondata);
  final res = list.map((e) => Appoinments.fromJson(e)).toList();
  return res;
}

class DrAppointment {
  int? id;
  int? drId;
  DateTime? date;
  String? time;
  String? drname;
  String? subtitle;
  String? image;
  String? about;
  double? rating;
  DrAppointment({
    this.id,
    this.drId,
    this.date,
    this.time,
    this.drname,
    this.subtitle,
    this.image,
    this.about,
    this.rating,
  });
  

  DrAppointment copyWith({
    int? id,
    int? drId,
    DateTime? date,
    String? time,
    String? drname,
    String? subtitle,
    String? image,
    String? about,
    double? rating,
  }) {
    return DrAppointment(
      id: id ?? this.id,
      drId: drId ?? this.drId,
      date: date ?? this.date,
      time: time ?? this.time,
      drname: drname ?? this.drname,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
      about: about ?? this.about,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(drId != null){
      result.addAll({'drId': drId});
    }
    if(date != null){
      result.addAll({'date': date!.millisecondsSinceEpoch});
    }
    if(time != null){
      result.addAll({'time': time});
    }
    if(drname != null){
      result.addAll({'drname': drname});
    }
    if(subtitle != null){
      result.addAll({'subtitle': subtitle});
    }
    if(image != null){
      result.addAll({'image': image});
    }
    if(about != null){
      result.addAll({'about': about});
    }
    if(rating != null){
      result.addAll({'rating': rating});
    }
  
    return result;
  }

  factory DrAppointment.fromMap(Map<String, dynamic> map) {
    return DrAppointment(
      id: map['id']?.toInt(),
      drId: map['drId']?.toInt(),
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date']) : null,
      time: map['time'],
      drname: map['drname'],
      subtitle: map['subtitle'],
      image: map['image'],
      about: map['about'],
      rating: map['rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DrAppointment.fromJson(String source) => DrAppointment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DrAppointment(id: $id, drId: $drId, date: $date, time: $time, drname: $drname, subtitle: $subtitle, image: $image, about: $about, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DrAppointment &&
      other.id == id &&
      other.drId == drId &&
      other.date == date &&
      other.time == time &&
      other.drname == drname &&
      other.subtitle == subtitle &&
      other.image == image &&
      other.about == about &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      drId.hashCode ^
      date.hashCode ^
      time.hashCode ^
      drname.hashCode ^
      subtitle.hashCode ^
      image.hashCode ^
      about.hashCode ^
      rating.hashCode;
  }
}
