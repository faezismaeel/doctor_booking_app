import 'package:book_your_doctor/screens/home/categories/categories.dart';
import 'package:book_your_doctor/screens/home/home_screen/doctors_list.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_header.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

  SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          SizedBox(height: 10,),
          Categories(),
          SizedBox(height: 10,),
          DoctorsList(),
        ],
      ),
    );
  }
}
