import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'doctors_model.g.dart';

@HiveType(typeId: 1)
class DoctorsModel {

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
  double? rating;


  DoctorsModel({
    this.id,
    this.drname,
    this.subtitle,
    this.image,
    this.about,
    this.rating,
  });


  DoctorsModel copyWith({
    int? id,
    String? drname,
    String? subtitle,
    String? image,
    String? about,
    double? rating,
  }) {
    return DoctorsModel(
      id: id ?? this.id,
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

  factory DoctorsModel.fromMap(Map<String, dynamic> map) {
    return DoctorsModel(
      id: map['id']?.toInt(),
      drname: map['drname'],
      subtitle: map['subtitle'],
      image: map['image'],
      about: map['about'],
      rating: map['rating']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorsModel.fromJson(String source) => DoctorsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorsModel(id: $id, drname: $drname, subtitle: $subtitle, image: $image, about: $about, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DoctorsModel &&
      other.id == id &&
      other.drname == drname &&
      other.subtitle == subtitle &&
      other.image == image &&
      other.about == about &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      drname.hashCode ^
      subtitle.hashCode ^
      image.hashCode ^
      about.hashCode ^
      rating.hashCode;
  }
}
