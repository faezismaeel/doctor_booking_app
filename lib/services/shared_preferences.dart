import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLogin() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.setBool('loggedIn', true);
}

Future<bool> getLogin() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getBool('loggedIn')?? false;
}

Future<bool> clearPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.clear();
}


Future<bool> setUser(String name) async{
  var prefs = await SharedPreferences.getInstance();
  return prefs.setString("name", name);
}

Future<String?> getUser() async{
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString("name");
}