import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/functions/appoinment_db_functions.dart';
import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key, required this.drname, required this.image, required this.id});

  final String drname,image;
  final int id;

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
    String selectedTime = "";
    DateTime currentDate = DateTime.now();
    DateTime selectedDate =DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year);

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
     List time =[
      "11:00AM",
      "12:00PM",
      "01:00PM",
      "02:00PM",
      "03:00PM",
      "04:00PM",
      "05:00PM",
      "06:00PM",
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
                ),
                 const SizedBox(
                height: 10,
              ),
              // const VistingHour(),
              Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text("Visit Hour",
           style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
          ),
        ),
        const SizedBox(height: 10,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: time.map((e) =>  GestureDetector(
            onTap: (){
              setState(() {
                selectedTime= e;
              });
            },
            child: Container(
                height: 40,
                width: 80,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(e,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: selectedTime == e ? Colors.white : const Color.fromARGB(255, 87, 82, 82)
                  ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  color: selectedTime == e ? const Color.fromARGB(198, 159, 119, 253) : null
                ),
              ),
          )).toList(),
        ),
      ],
    ),
              const SizedBox(height: 25,),
              DefaultButton(
                text: "Book Appoinment",
                press: (){
                  final schedule = DrAppointment(
                    date: selectedDate,
                    time: selectedTime,
                    drname: widget.drname,
                    image: widget.image,
                    id: DateTime.now().millisecond,
                    drId: widget.id
                    );
                    addSchedule(schedule);
               ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text("Appointment Success",style: TextStyle(color:  Color.fromARGB(197, 126, 70, 255)),),
                  backgroundColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: "Dismiss", onPressed: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_){
                          return const HomeScreen();
                        })
                      );
                    },
                    textColor: Colors.black,
                    ),
                  ),
);
                    }) 

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
