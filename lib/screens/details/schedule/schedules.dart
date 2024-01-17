import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
    DateTime currentDate = DateTime.now();
    DateTime selectedDate =DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
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
  @override
  Widget build(BuildContext context) {
   final monthDays = DateTime(currentDate.year, currentDate.month + 1,0).day;
    return  Column(
      children: [
        Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Schedules",
                      style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                      Row(
                        children: [
                          Text(months[currentDate.month -1],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 78, 78, 78)
                          ),
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.arrow_forward_ios,size: 15,color: Color.fromARGB(255, 17, 11, 11),),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
              height: 10,
            ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(monthDays, (index){
                        DateTime day =DateTime(currentDate.year, currentDate.month,index + 1);
                        bool isToday = day.day == currentDate.day && day.month == currentDate.month && day.year == currentDate.year ;
                        // List isSelected = [ day.day,day.month,day.year ];
                        DateTime date = DateTime(day.year,day.month,day.day);
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedDate = date;
                              print(selectedDate);
                            });
                          },
                          child: Container(
                            width: 65,
                            height: 70,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: selectedDate == date ? null : ( isToday? null : Border.all(color: Colors.black.withOpacity(0.3))),
                              borderRadius: BorderRadius.circular(15),
                              color: selectedDate==date ? const Color.fromARGB(198, 159, 119, 253) : (isToday ? const Color.fromARGB(197, 0, 0, 0) : null)
                              ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("${day.day}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: selectedDate == date ? Colors.white : (isToday ? Colors.white : null)
                              ),
                              ),
                              Text(getDayOfWeek(day),
                              style: TextStyle(
                                color:  selectedDate == date ? Colors.white : (isToday ? Colors.white : Colors.grey),
                              ),
                              )
                                               ],),
                          ),
                        );
                      })
                    ],
                  ),
                )
      ],
    );
  }
}
String getDayOfWeek(DateTime day) {
    switch (day.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
