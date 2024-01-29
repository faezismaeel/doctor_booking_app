import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:book_your_doctor/screens/splash/splash_screen.dart';
import 'package:book_your_doctor/services/shared_preferences.dart';
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
  if(!Hive.isAdapterRegistered(UserModelAdapter().typeId)){
    Hive.registerAdapter(UserModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light ,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: FutureBuilder(
        future: getLogin(),
        builder: (context,snapshot){
          if(snapshot.data == true){
            return const HomeScreen();
          }else{
            return const SplashScreen();
          }
        }
        ),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

