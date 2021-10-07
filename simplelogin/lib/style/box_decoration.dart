import 'package:testproject/utils/page_exporter.dart';

class BD {
  static get makeRoundedButton =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));
}

BoxDecoration backDecor = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(
        "assets/images/1.jpg",
      ),
      fit: BoxFit.cover),
);
