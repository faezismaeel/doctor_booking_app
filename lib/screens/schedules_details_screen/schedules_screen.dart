import 'package:book_your_doctor/components/custom_navbar.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class SchedulesScreen extends StatefulWidget {
  const SchedulesScreen({super.key, required this.drname, required this.date, required this.time, required this.image, required this.rating});

final String drname,image,date,time;
final double rating;
  @override
  State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedules"),
        centerTitle: true,
        ),
      bottomNavigationBar: CustomNavBar(selectedMenu: MenuState.schedules),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
        height: SizeConfig.screenHeight * 0.2,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Image(image: AssetImage(widget.image),fit: BoxFit.cover,),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color.fromARGB(255, 107, 225, 111),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_half_rounded,
                      color: Color.fromARGB(255, 141, 240, 144),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${widget.rating}")
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            children: [
             Text(
               widget.drname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
             ),
              const SizedBox(height: 10,),
              Text(
                widget.date,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal
                ),
              ),
              
            ],
          ),
        ]),
          ),
          
        
          ],
        ),
      ),
    );
  }
}