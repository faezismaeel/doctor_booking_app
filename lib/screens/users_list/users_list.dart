import 'package:book_your_doctor/functions/user_db_functions.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  Widget build(BuildContext context) {
    getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        builder: (BuildContext context,List<UserModel> usersList , Widget? child){
          return ListView.separated(
            itemBuilder: ((context,index){
              final data = usersList[index];
             return Container(
                   margin: const EdgeInsets.all(10),
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
                         children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: const Image(image: AssetImage("assets/images/doctor_two.png"),fit: BoxFit.cover,),
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
                  Text(data.id.toString())
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
              
                text: "${data.name}\n",
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
                      text: data.email)
                ])),
                         const SizedBox(height: 10,),
                       ],
                     ),
                   ]),
                 );
            }
            ),
            separatorBuilder: (ctx,index){
              return const SizedBox();
            },
            itemCount: usersList.length);
        },
        valueListenable: userNotifier,

        ),
    );
  }
}