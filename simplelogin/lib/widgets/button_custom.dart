import 'package:testproject/utils/page_exporter.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final Function() onPress;
  const ButtonCustom({
    required this.text,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width / 2,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(KC.primaryColor),
              padding: MaterialStateProperty.all(EdgeInsets.all(8)),
              elevation: MaterialStateProperty.all(8)),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
