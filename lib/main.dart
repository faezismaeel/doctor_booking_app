import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(AppoinmentsAdapter().typeId)){
    Hive.registerAdapter(AppoinmentsAdapter());
  }
  if(!Hive.isAdapterRegistered(DoctorsModelAdapter().typeId)){
    Hive.registerAdapter(DoctorsModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

