import 'package:book_your_doctor/screens/schedules_details_screen/schedules_screen.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppoinmentSuccess extends StatefulWidget {
  const AppoinmentSuccess({super.key ,required this.drname, required this.date, required this.time, required this.image, required this.rating});
  final String drname,image,time;
final DateTime date;
final double rating;

  @override
  State<AppoinmentSuccess> createState() => _AppoinmentSuccessState();
}

class _AppoinmentSuccessState extends State<AppoinmentSuccess> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMM d,EEEE,yyyy').format(widget.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        ),
      // bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.schedules),
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
              Text( formattedDate,
                style: const TextStyle(
                  color: Color.fromARGB(198, 137, 87, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(widget.time,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  // SizedBox(width: 10,),
                  // Icon(Icons.access_time_sharp)
                ],
              )
              
            ],
          ),
        ]),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_){
                return SchedulesScreen(rating: 1);
              })
            );
          }, child: Text("Appoinments"))
          ],
        ),
      ),
    );
  }
}