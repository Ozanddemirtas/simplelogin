import 'package:testproject/utils/page_exporter.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Services.currentUser = sharedPrefs.user;
    return sharedPrefs.hasLogin ? Homepage() : LoginPage();
  }
}
