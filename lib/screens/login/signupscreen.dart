import 'package:book_your_doctor/components/account_exist_text.dart';
import 'package:book_your_doctor/components/default_button.dart';
import 'package:book_your_doctor/forms/signforms.dart';
import 'package:book_your_doctor/functions/user_db_functions.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:book_your_doctor/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conformPassController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                    color: Color.fromARGB(255, 155, 97, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                "Create a new account",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      NameFieldForm(controller: nameController),
                      const SizedBox(
                        height: 20,
                      ),
                      SignEmailForm(controller: emailController),
                       const SizedBox(
                        height: 20,
                      ),
                      PhoneFieldForm(controller: phoneController),
                       const SizedBox(
                        height: 20,
                      ),
                      SignPassForm(controller: passController),
                      const SizedBox(
                        height: 20,
                      ),
                      ConformPassForm(controller: conformPassController),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        text: "CREATE ACCOUNT",
                        press: ()async{
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            final user = UserModel(
                              id: DateTime.now().millisecond, 
                              name: nameController.text,
                              email: emailController.text,
                              number: int.tryParse(phoneController.text),
                              password: passController.text,
                              );
                              addUser(user);
                            Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_){
                              return const LoginScreen();
                            })
                          );
                          }
                        },
                        ),
                        const SizedBox(
                        height: 20,
                      ),
                      AccountExistText(
                        press: (){},
                        text: "Already have an account ? ",
                        buttonText: "Login"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


