import 'package:http/http.dart' as http;
import 'package:testproject/utils/page_exporter.dart';

class Services {
  static UserModel currentUser = UserModel();
  String baseUrl = "http://test11.internative.net/";
  Uri getUrl(String endpoint) => Uri.parse(baseUrl + endpoint);
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + sharedPrefs.token
      };

  Future<ResponseModel> login(
      String userName, String password, bool rememberMe) async {
    http.Response response = await http.post(
      getUrl("Login/SignIn"),
      body: jsonEncode({"Email": userName, "Password": password}),
      headers: {"Content-Type": "application/json"},
    );

    ResponseModel data = ResponseModel.fromJson(response.body);

    if (rememberMe) {
      if (!data.hasError) {
        sharedPrefs.setToken(data.data["Token"]);
      }
    }

    await getCurrentUser();

    return data;
  }

  Future<ResponseModel> getUserList() async {
    http.Response response =
        await http.get(getUrl("User/GetUsers"), headers: headers);
    return ResponseModel.fromJson(response.body);
  }

  Future getCurrentUser() async {
    http.Response response =
        await http.get(getUrl("Account/Get"), headers: headers);
    var user = ResponseModel.fromJson(response.body);
    if (!user.hasError) {
      currentUser = UserModel.fromJson(user.data);
      sharedPrefs.setUser(currentUser);
    }
  }

  Future<ResponseModel> getUserDetails(String userId) async {
    http.Response response = await http.post(getUrl("Account/GetUserDetails"),
        headers: headers, body: jsonEncode({"Id": userId}));
    return ResponseModel.fromJson(response.body);
  }

  Future<ResponseModel> getFriends() async {
    http.Response response =
        await http.get(getUrl("Account/GetFriendList"), headers: headers);
    return ResponseModel.fromJson(response.body);
  }

  Future<ResponseModel> addToFriends(String userId) async {
    http.Response response = await http.post(getUrl("User/AddToFriends"),
        headers: headers, body: jsonEncode({"UserId": userId}));
    return ResponseModel.fromJson(response.body);
  }

  Future<ResponseModel> removeToFriends(String userId) async {
    http.Response response = await http.post(getUrl("User/RemoveFromFriends"),
        headers: headers, body: jsonEncode({"UserId": userId}));
    return ResponseModel.fromJson(response.body);
  }
}
