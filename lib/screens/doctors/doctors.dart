import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/forms/add_doctors_form.dart';
import 'package:book_your_doctor/functions/db_functions.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/screens/doctors/doctors_hive_list.dart';
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
                NameInputField(nameController: nameController),
                SizedBox(height: 20,),
                SubTitleInputField(subController: subController),
                SizedBox(height: 20,),
                AboutInputField(aboutController: aboutController),
                SizedBox(height: 20,),
                ImageInputField(urlController: urlController),
                SizedBox(height: 20,),
                RatingInputField(ratingController: ratingController),
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
                        rating: double.tryParse(ratingController.text));
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

