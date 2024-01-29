import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserModel {
  
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  @HiveField(3)
  int? number;

  @HiveField(4)
  String? password; 

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.password,
  });



  UserModel copyWith({
    String? name,
    String? email,
    int? number,
    String? password,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(name != null){
      result.addAll({'name': name});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(number != null){
      result.addAll({'number': number});
    }
    if(password != null){
      result.addAll({'password': password});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      number: map['number']?.toInt(),
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, number: $number, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.email == email &&
      other.number == number &&
      other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      number.hashCode ^
      password.hashCode;
  }
}
