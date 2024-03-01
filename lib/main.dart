import 'package:book_your_doctor/models/appoinments_model.dart';
import 'package:book_your_doctor/models/doctors_model.dart';
import 'package:book_your_doctor/models/user_model.dart';
import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:book_your_doctor/screens/splash/splash_screen.dart';
import 'package:book_your_doctor/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:adaptive_theme/adaptive_theme.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp( MyApp(savedThemeMode: savedThemeMode,));
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
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple
      ),
      dark:ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple
      ), 
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme,darkTheme){
        print(theme);
        return MaterialApp(
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
  });
}

}