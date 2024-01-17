import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> categories = [
      {"icon":"assets/icons/all_icon.svg","text":"All"},
      {"icon":"assets/icons/cardiology_icon.svg","text":"Cardiology"},
      {"icon":"assets/icons/medicine_icon.svg","text":"Medicine"},
      {"icon":"assets/icons/general_icon.svg","text":"General"}
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Categories",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            )),
        ),
          const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(categories.length, (index) => CategoryCards(
                icon: categories[index]["icon"],
                text: categories[index]["text"],
                press: (){}))
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({super.key, required this.icon, required this.text, required this.press});

final String icon,text;
final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: SvgPicture.asset(icon),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(height: 20,),
           Text(text,
           textAlign: TextAlign.center,
           style: TextStyle(
            color: Colors.black.withOpacity(0.6),
           ),
           )
        ],
      ),
    );
  }
}
// #bc9ffc 
// #e1d4fe