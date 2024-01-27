import 'package:book_your_doctor/screens/doctors/doctors.dart';
import 'package:book_your_doctor/screens/doctors/doctors_hive_list.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:book_your_doctor/screens/schedules_details_screen/schedules_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key, required this.selectedMenu,
  });

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_){
                          return const HomeScreen();
                        })
                      );
                    },
                    icon: SvgPicture.asset("assets/icons/home.svg",
                    color: MenuState.home == selectedMenu ? const Color.fromARGB(197, 145, 98, 254) : Colors.blueGrey,
                    width: 30,
                    ),
                  ),
                  if(selectedMenu.index == 0)
                  selectedDot()
                ],
              ),
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(
              onPressed: (){
                 Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_){
                          return const SchedulesScreen();
                        })
                      );
              },
              icon:  SvgPicture.asset("assets/icons/calendar.svg",
                color: MenuState.schedules == selectedMenu ? const Color.fromARGB(197, 145, 98, 254) : Colors.blueGrey,
                width: 30,
              ),),
              if(selectedMenu.index == 1)
              selectedDot()
           ],
         ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_){
                    return DoctorsHiveList();
                  })
                );
              },
              icon:SvgPicture.asset("assets/icons/chat.svg",
                color: MenuState.messages == selectedMenu ? const Color.fromARGB(197, 145, 98, 254) : Colors.blueGrey,
                width: 30,
              ),),
               if(selectedMenu.index == 2)
               selectedDot()
          ],
        ),
          GestureDetector(
            onTap: (){
               Navigator.of(context).push(
                    MaterialPageRoute(builder: (_){
                      return Doctors();
                    })
                  );
            },
            child: const Stack(
              alignment: Alignment.center,
              children:[
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color.fromARGB(197, 145, 98, 254),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add,
                  color: Color.fromARGB(197, 145, 98, 254),
                  size: 16,
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }

  CircleAvatar selectedDot() {
    return const CircleAvatar(
      radius: 3,
      backgroundColor: Color.fromARGB(197, 145, 98, 254),
    );
  }
}

enum MenuState{home,schedules,messages}