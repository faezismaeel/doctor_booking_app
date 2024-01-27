import 'package:book_your_doctor/components/custom_navbar.dart';
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
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 10,),
            Categories(),
            SizedBox(height: 10,),
            DoctorsList(
              id: 8,
              title: "Dr.Name 1",
              subTitle: "Heart Surgeon , London , England",
              image: "assets/images/doctor_one.png",
              rating: 4.9,
            ),
            SizedBox(height: 10,),
            DoctorsList(
              id: 9,
               title: "Dr.Name 2",
              subTitle: "General Dentist",
              image: "assets/images/doctor_two.png",
              rating: 4,
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}


