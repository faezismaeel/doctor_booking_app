import 'package:book_your_doctor/screens/details/analystics.dart';
import 'package:book_your_doctor/screens/details/schedule/schedules.dart';
import 'package:flutter/material.dart';

class AppoinmemntDetails extends StatefulWidget {
  const AppoinmemntDetails(
      {super.key, required this.image, required this.name, required this.about, required this.subtitle});
  final String image, name,subtitle,about;

  @override
  State<AppoinmemntDetails> createState() => _AppoinmemntDetailsState();
}

class _AppoinmemntDetailsState extends State<AppoinmemntDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appoinment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 90,
                      width: 90,
                      child: Image(image: AssetImage(widget.image)),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Color.fromARGB(255, 107, 225, 111),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
               Text( widget.subtitle,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(221, 136, 135, 135)),
              ),
              const SizedBox(
                height: 20,
              ),
              const DoctorAnalystics(),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("About Doctor",
                style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                ),
              ),
               const SizedBox(
                height: 10,
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                        TextSpan(
                            text:
                                widget.about,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 167, 159, 159),
                                  fontSize: 17
                                )
                                )
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Schedules(drname: widget.name,image: widget.image,),            
            ],
          ),
        ),
      ),
    );
  }
}
