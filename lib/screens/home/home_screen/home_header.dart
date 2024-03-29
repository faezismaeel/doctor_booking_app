import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:book_your_doctor/screens/login/login_screen.dart';
import 'package:book_your_doctor/screens/users_list/users_list.dart';
import 'package:book_your_doctor/services/shared_preferences.dart';
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
                                return const UsersListScreen();
                              })
                            );
                          },
                          icon: const Icon(Icons.menu)),
                          IconButton(
                            onPressed: (){
                              clearPrefs();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_){
                                  return LoginScreen();
                                })
                              );
                            },
                            icon: Icon(Icons.logout),
                            ),
                            Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){
                          AdaptiveTheme.of(context).setLight();
                          print("Switched to light theme");
                        },
                        icon: Icon(Icons.light_mode_outlined,
                        color: AdaptiveTheme.of(context).mode.isDark ? Colors.grey : Colors.black,
                        ),
                        ),
                      IconButton(
                        onPressed: (){
                           AdaptiveTheme.of(context).setDark();
                          print("Switched to drak theme");

                        },
                        icon: Icon(Icons.dark_mode_outlined,
                        color: AdaptiveTheme.of(context).mode.isDark ? Colors.white : Colors.grey,

                        ),
                        )
                    ],
                  ),
                ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                              child: FutureBuilder(
                                future: getUser(), 
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    return Text(snapshot.data??"");
                                  }return Text("hii");
                                }),
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