import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? prefs;

  // ignore: non_constant_identifier_names
  //// Regresa una lista de string
  //  0 = name, 1 = pass
  ////
  Future<List<String>> getUserNPasword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString('name') ?? '';
    String pass = prefs.getString('password') ?? '';
    return [name, pass];
  }

  Future<void> putUserNPasword(name, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('password', password);
  }
}
