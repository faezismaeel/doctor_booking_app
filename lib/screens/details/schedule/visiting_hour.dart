import 'package:flutter/material.dart';

class VistingHour extends StatefulWidget {
  const VistingHour({super.key});

  @override
  State<VistingHour> createState() => _VistingHourState();
}

class _VistingHourState extends State<VistingHour> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
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
    return Column(
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
                selected = e;
                print(selected);
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
                    color: selected == e ? Colors.white : const Color.fromARGB(255, 87, 82, 82)
                  ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  color: selected == e ? const Color.fromARGB(198, 159, 119, 253) : null
                ),
              ),
          )).toList(),
        ),
      ],
    );
  }
}