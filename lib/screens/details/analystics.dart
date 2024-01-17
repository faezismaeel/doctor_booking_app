import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class DoctorAnalystics extends StatelessWidget {
  const DoctorAnalystics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
         height: SizeConfig.screenHeight * 0.15,
          width: SizeConfig.screenWidth * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(198, 159, 119, 253),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("350+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(199, 141, 99, 239),
                  ),
                  ),
                  Text("Patients",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("15+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 137, 247, 141),
                  ),
                  ),
                   Text("Exp.years",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("284+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 238, 139, 111),
                  ),
                  ),
                  Text("Reviews",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}