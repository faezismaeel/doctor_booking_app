import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.2,
          width: SizeConfig.screenWidth * 0.9,
          decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Column(
                children: [
                  Stack(
                    children:[ 
                      Container(
                      height: 70,
                      width: 70,
                      child: Icon(Icons.person),
                      decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: const Color.fromARGB(255, 107, 225, 111),
                      ),
                    )
                ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.star_half_rounded,color: Color.fromARGB(255, 141, 240, 144),),
                    SizedBox(width: 10,),
                    Text("4.8")
                  ],
                )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 30),
                  child: Text.rich(
                    TextSpan(
                      text: "Dr.Name\n",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.5)
                          ),
                          text: "Heart Surgeon,London,England"
                        )
                      ]
                    )
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight/20,
                  width: SizeConfig.screenWidth * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Appointment"),
                  ),
                )
              ],
            ),
          ]),
        ),
      ],
    );
  }
}