import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/forms/add_doctors_form.dart';
import 'package:book_your_doctor/functions/doctors_db_functions.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/screens/doctors/doctors_hive_list.dart';
import 'package:flutter/material.dart';

class EditDoctors extends StatefulWidget {
  const EditDoctors(
      {super.key,
      required this.drname,
      required this.about,
      required this.image,
      required this.rating,
      required this.subtitle,
      required this.id});

  final int id;
  final String drname;
  final String subtitle;
  final String image;
  final String about;
  final String rating;

  @override
  State<EditDoctors> createState() => _EditDoctorsState();
}

class _EditDoctorsState extends State<EditDoctors> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.drname;
    subController.text = widget.subtitle;
    aboutController.text = widget.about;
    urlController.text = widget.image;
    ratingController.text = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit doctors"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                NameInputField(nameController: nameController),
                const SizedBox(
                  height: 20,
                ),
                SubTitleInputField(subController: subController),
                const SizedBox(
                  height: 20,
                ),
                AboutInputField(aboutController: aboutController),
                const SizedBox(
                  height: 20,
                ),
                ImageInputField(urlController: urlController),
                const SizedBox(
                  height: 20,
                ),
                RatingInputField(ratingController: ratingController),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    text: "Submit",
                    press: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        final editedDoctor = DoctorsModel(
                            id: widget.id,
                            drname: nameController.text,
                            subtitle: subController.text,
                            image: urlController.text,
                            about: aboutController.text,
                            rating:double.tryParse(ratingController.text));
                        editDoctor(editedDoctor);
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (_) {
                          return const DoctorsHiveList();
                        }));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
