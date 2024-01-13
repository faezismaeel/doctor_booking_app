import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
    DateTime currentMonth = DateTime.now();
    List months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    final currentDate = [DateTime.now().day];
  @override
  Widget build(BuildContext context) {
    print(currentDate);

    return  Column(
      children: [
        Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Schedules",
                      style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                      Row(
                        children: [
                          Text(months[currentMonth.month -1],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 78, 78, 78)
                          ),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,size: 15,color: Color.fromARGB(255, 17, 11, 11),),
                        ],
                      ),

                    ],
                  ),
                ),
      ],
    );
  }
}
