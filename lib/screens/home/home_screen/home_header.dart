import 'package:book_your_doctor/screens/login/login_screen.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: SizeConfig.screenHeight/2,
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
                color: Color.fromARGB(199, 169, 133, 252),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_){
                                return LoginScreen();
                              })
                            );
                          },
                          icon: const Icon(Icons.menu)),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text.rich(
                      TextSpan(
                        text: "Welcome Back\n",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        children: [
                          TextSpan(
                              text: "Let's find\nyour top doctor!",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: SizeConfig.screenWidth * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10))
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search health issue.......",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                      prefixIcon: Icon(Icons.search,color:Colors.black.withOpacity(0.3) ,),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}