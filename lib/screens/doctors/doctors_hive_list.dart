import 'package:book_your_doctor/components/custom_navbar.dart';
import 'package:book_your_doctor/functions/db_functions.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/screens/details/appoinment_details.dart';
import 'package:book_your_doctor/screens/doctors/edit_doctors.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class DoctorsHiveList extends StatefulWidget {
  const DoctorsHiveList({super.key});

  @override
  State<DoctorsHiveList> createState() => _DoctorsHiveListState();
}

class _DoctorsHiveListState extends State<DoctorsHiveList> {
  @override
  Widget build(BuildContext context) {
    getDoctors();
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.messages),
      appBar: AppBar(
        title: const Text("Doctors"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<DoctorsModel> doctorsList,Widget? child){
          return ListView.separated(
            itemBuilder: ((context, index){
              final data = doctorsList[index];
             return Container(
                   margin: EdgeInsets.all(10),
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
                      child: Image(image: AssetImage(data.image.toString()),fit: BoxFit.cover,),
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
                  Text(data.rating.toString())
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
                         Text.rich(TextSpan(
              
                text: "${data.drname}\n",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.5)),
                      text: data.subtitle)
                ])),
                         const SizedBox(height: 10,),
                         Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.2),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_){
                        return AppoinmemntDetails(id: data.id! , image: data.image.toString(),name: data.drname.toString(),about: data.about.toString(),subtitle: data.subtitle.toString());
                      })
                    );
                  },
                  child: const Text("Appointment",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                  ),
                  ),
                ),
                SizedBox(width: 10,),
                 IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_){
                          return EditDoctors(
                            id: data.id!,
                            drname: data.drname.toString(),
                            about: data.about.toString(),
                            image: data.image.toString(),
                            rating: data.rating.toString(),
                            subtitle: data.subtitle.toString());
                        })
                      );
                    },
                    )
              ],
                         ),
                       ],
                     ),
                   ]),
                 );
            }),
            separatorBuilder: (ctx,index){
              return const SizedBox();
            },
            itemCount: doctorsList.length);
        },
        valueListenable: doctorsNotifier,
        
        ),
    );
  }
}