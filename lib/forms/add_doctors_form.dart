import 'package:flutter/material.dart';

class RatingInputField extends StatelessWidget {
  const RatingInputField({
    super.key,
    required this.ratingController,
  });

  final TextEditingController ratingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ratingController,
       validator: (value) {
        if(value!.isEmpty){
          return "Please Enter Ratings";
        } return null;
        },
      textInputAction: TextInputAction.done,
      decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
          // gapPadding: 10,
        ),
        hintText: "Rating",
        contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: "Dr Ratings",
        ),
    );
  }
}

class ImageInputField extends StatelessWidget {
  const ImageInputField({
    super.key,
    required this.urlController,
  });

  final TextEditingController urlController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: urlController,
       validator: (value) {
        if(value == null || value.isEmpty){
          return "Please Enter URL";
        } return null;
        },
      textInputAction: TextInputAction.next,
      decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
          // gapPadding: 10,
        ),
        hintText: "URL",
        contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: "Image URL",
        ),
    );
  }
}

class AboutInputField extends StatelessWidget {
  const AboutInputField({
    super.key,
    required this.aboutController,
  });

  final TextEditingController aboutController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: aboutController,
       validator: (value) {
        if(value == null || value.isEmpty){
          return "Please Enter About Doctor";
        }return null;
        },
      textInputAction: TextInputAction.next,
      decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
          // gapPadding: 10,
        ),
        hintText: "About",
        contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: "About Doctor",
        ),
    );
  }
}

class SubTitleInputField extends StatelessWidget {
  const SubTitleInputField({
    super.key,
    required this.subController,
  });

  final TextEditingController subController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: subController,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Please Enter Subtitle";
        } return null;
        },
      textInputAction: TextInputAction.next,
      decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
          // gapPadding: 10,
        ),
        hintText: "Subtitle",
        contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: "Specialist",
        ),
    );
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Please Enter Doctor's Name";
        }return  null;
      },
      textInputAction: TextInputAction.next,
      decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
          // gapPadding: 10,
        ),
        hintText: "Full Name",
        contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical:20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color.fromARGB(198, 137, 87, 255)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: "Doctor's Name",
        ),
    );
  }
}