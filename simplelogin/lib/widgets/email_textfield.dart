import 'package:testproject/utils/page_exporter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.hint,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) => onChange(value),
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: KC.primaryColor,
              width: 2.0,
            ),
          ),
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.email,
            color: KC.primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelStyle: TextStyle(color: KC.primaryColor),
          hintText: hint,
          label: Text(label),
        ),
      ),
    );
  }
}
