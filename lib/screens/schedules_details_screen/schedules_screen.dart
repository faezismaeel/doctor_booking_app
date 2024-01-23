import 'package:book_your_doctor/components/custom_navbar.dart';
import 'package:book_your_doctor/functions/db_functions.dart';
import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchedulesScreen extends StatefulWidget {
  const SchedulesScreen({super.key,required this.rating});
  final double rating;


  @override
  State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  @override
  Widget build(BuildContext context) {
    getSchedule();
    return Scaffold(
            bottomNavigationBar: CustomNavBar(selectedMenu: MenuState.schedules),
            appBar: AppBar(
              title: Text("Appoinments"),
              centerTitle: true,
            ),
            body: ValueListenableBuilder(
      builder:(BuildContext ctx, List<Appoinments> appoinmentList, Widget? child){
        return   ListView.separated(
        itemBuilder: (ctx,index){
          final data = appoinmentList[index];
          final formattedDate = DateFormat('MMM d,EEEE,yyyy').format(data.date!);
          return   Padding(
                    padding: const EdgeInsets.all(5),
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
                          child: Image(image: AssetImage(data.image!),fit: BoxFit.cover,),
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
                 data.drname!,
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
                    Text(data.time!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(width: 10,),
                    IconButton(
                      onPressed:() async {
                       DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate:  DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                          );
                          if(selectedDate != null){
                          final formattedDate = DateFormat('MMM d,EEEE,yyyy').format(selectedDate);
                            print(formattedDate);
                            
                          }
                      },
                      icon:Icon(Icons.edit_calendar_outlined)),
                      IconButton(
                      onPressed:(){
                        if(data.id != null){
                          deleteSchedule(data.id!);
                        } else{
                          print("Id is null");
                        }
                      },
                      icon:Icon(Icons.delete))
                  ],
                )
                
              ],
            ),
                    ]),
            ),
            
                    
            ],
                    ),
                  );
 
        },
        separatorBuilder: (ctx,index){
          return SizedBox();
        },
        itemCount: appoinmentList.length,

      );
 
      },
      valueListenable: scheduleNotifier,
    )
            
                   );
 
    
    
    }
}