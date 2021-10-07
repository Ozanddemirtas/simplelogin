import 'dart:convert';

import 'package:testproject/utils/page_exporter.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  SharedPreferences? pref;

  Future init() async {
    // ignore: unnecessary_null_comparison
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
      pref = _sharedPrefs;
      print(_sharedPrefs);
    }
  }

  setInstance(SharedPreferences instance) {
    if (_sharedPrefs == null) {
      _sharedPrefs = instance;
      print("==>>setPrefs ==>>>" + _sharedPrefs!.getKeys().toString());
    }
  }

  String get token => _sharedPrefs?.getString("token") ?? "";
  setToken(String token) {
    _sharedPrefs!.setString("token", token);
  }

  bool get hasLogin => token.isNotEmpty && userJson != "{}";
  String get userJson => _sharedPrefs?.getString("user") ?? "{}";
  UserModel get user {
    return UserModel.fromJson(jsonDecode(userJson));
  }

  setUser(UserModel user) {
    _sharedPrefs!.setString("user", jsonEncode(user.toJson()));
  }

  logout() {
    _sharedPrefs!.remove("token");
    _sharedPrefs!.remove("user");
  }

  void reset() {
    _sharedPrefs!.clear();
  }

  bool get isFirst => _sharedPrefs!.getBool("isFirst") ?? false;
  void setFirst() {
    _sharedPrefs!.setBool("isFirst", true);
  }
}

final sharedPrefs = SharedPrefs();
