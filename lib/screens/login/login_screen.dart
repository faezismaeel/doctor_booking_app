import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/components/account_exist_text.dart';
import 'package:book_your_doctor/forms/signforms.dart';
import 'package:book_your_doctor/functions/user_db_functions.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:book_your_doctor/screens/login/signupscreen.dart';
import 'package:book_your_doctor/services/shared_preferences.dart';
import 'package:book_your_doctor/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Column(children: [
              Container(
                height: SizeConfig.screenHeight * 0.2,
                width: SizeConfig.screenWidth * 0.3,
                child:
                    SvgPicture.asset("assets/icons/app-doctor-svgrepo-com.svg"),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(197, 109, 46, 255),
                    fontSize: 25),
              ),
              const Text(
                "Sign to continue",
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SignEmailForm(controller: emailController,),
            const SizedBox(height: 20,),
            SignPassForm(controller: passController,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  // style: ButtonStyle(),
                  onPressed: (){},
                  child: const Text(
                    "Forgot Password?",
                  ),
                  ),
              ],
            ),
            const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DefaultButton(
                  text: "LOGIN",
                  press: ()async{
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      List<UserModel> users = await getUsers();
                      UserModel userAuth = users.firstWhere((element) =>
                        element.email == emailController.text &&
                        element.password == passController.text,
                      );
                      setUser(userAuth.name.toString());
                      setLogin();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_){
                          return const HomeScreen();
                        })
                      );
                    }
                    
                  }
                  
                  ),
              ),
          ],
        ),
      ),
    ),
              
               AccountExistText(
                text: "Don't have an account ? ",
                buttonText: "Signup",
                press: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_){
                      return const SignUpScreen();
                    })
                  );
                },
                )
            ]),
          ),
        ),
      ),
    );
  }
}
 