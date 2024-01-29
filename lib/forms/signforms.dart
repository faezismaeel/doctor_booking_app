import 'package:flutter/material.dart';

class NameFieldForm extends StatelessWidget {
  const NameFieldForm({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if (value!.isEmpty) {
          return "Please enter your name";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your name",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromARGB(198, 137, 87, 255)),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromARGB(198, 137, 87, 255)),
        ),
        labelText: "Name",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}


class SignEmailForm extends StatelessWidget {
  const SignEmailForm({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your email";
        }else if(!emailValidatorRegExp.hasMatch(value)){
          return "Please enter a valid email";
        }
        return null;
      },
      // controller: emailController,
      decoration: InputDecoration(
        hintText: "Enter your email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        labelText: "Email",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}


class PhoneFieldForm extends StatelessWidget {
  const PhoneFieldForm({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value){
        if (value!.isEmpty) {
          return "Please enter your phone";
        } return null;
      },
      // controller: emailController,
      decoration: InputDecoration(
        hintText: "Enter your number",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        labelText: "PHONE",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}


class SignPassForm extends StatelessWidget {
  const SignPassForm({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if (value!.isEmpty) {
          return "Please enter your password";
        } else if(value.length < 8){
          return "Password must contain 8 characters";
        }
        return null;
      },
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter your Password",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        labelText: "Password",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class ConformPassForm extends StatelessWidget {
  const ConformPassForm({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if (value!.isEmpty) {
          return "Please conform your password";
        } 
        return null;
      },
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Re-Enter your Password",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        labelText: "Conform Password",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
