import 'package:book_your_doctor/screens/details/appoinment_details.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.rating});
  final String title, subTitle, image;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Image(image: AssetImage(image),fit: BoxFit.cover,),
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
                    width: 10,
                  ),
                  Text("$rating")
                ],
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 30),
              child: Text.rich(TextSpan(
                  text: "$title\n",
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
                        text: subTitle)
                  ])),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_){
                    return AppoinmemntDetails(image: image,name: title,);
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
          ],
        ),
      ]),
    );
  }
}
