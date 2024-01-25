import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/functions/db_functions.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/screens/doctors/doctors_hive_list.dart';
import 'package:book_your_doctor/screens/schedules_details_screen/schedules_screen.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add doctors"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Doctor's Name";
                    }return  null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                      // gapPadding: 10,
                    ),
                    hintText: "Full Name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Doctor's Name",
                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: subController,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Subtitle";
                    } return null;
                    },
                  textInputAction: TextInputAction.next,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                      // gapPadding: 10,
                    ),
                    hintText: "Subtitle",
                    contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Specialist",
                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: aboutController,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter About Doctor";
                    }return null;
                    },
                  textInputAction: TextInputAction.next,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                      // gapPadding: 10,
                    ),
                    hintText: "About",
                    contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "About Doctor",
                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: urlController,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter URL";
                    } return null;
                    },
                  textInputAction: TextInputAction.next,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                      // gapPadding: 10,
                    ),
                    hintText: "URL",
                    contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Image URL",
                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: ratingController,
                   validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Ratings";
                    } return null;
                    },
                  textInputAction: TextInputAction.done,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                      // gapPadding: 10,
                    ),
                    hintText: "Rating",
                    contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: "Dr Ratings",
                    ),
                ),
                SizedBox(height: 20,),
                DefaultButton(
                  text: "Add Doctor",
                  press: ()async{
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      final doctor = DoctorsModel(
                        id: DateTime.now().millisecond, 
                        drname: nameController.text,
                        subtitle: subController.text,
                        image: urlController.text,
                        about: aboutController.text,
                        rating: ratingController.text);
                        print(doctor);
                        addDoctor(doctor);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_){
                            return DoctorsHiveList();
                          })
                        );
                    }
                  } )
              ],
            ),
          ),
        ),
      ),
    );
  }
}