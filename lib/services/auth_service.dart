import 'package:poke_app/services/localStorage.dart';

class AuthService {
  Future<bool> register(String name, String pass) async {
    LocalStorage ls = LocalStorage();
    try {
      ls.putUserNPasword(name, pass);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String name, String pass) async {
    LocalStorage ls = LocalStorage();

    List<String> userNPass = await ls.getUserNPasword();

    String _userLS = userNPass[0];
    String _passLS = userNPass[1];

    if (name == _userLS && _passLS == pass) {
      return true;
    }

    return false;
  }
}
