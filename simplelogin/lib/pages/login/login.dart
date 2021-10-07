import 'package:testproject/utils/page_exporter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool isObscure;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "eren@test.com");
    passwordController = TextEditingController(text: "123456");
    isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    String email = emailController.text;
    bool isValid = EmailValidator.validate(email);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: backDecor),
          Container(
            color: Colors.white54,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hint: "Email",
                      label: "Email",
                      controller: emailController,
                      onChange: (value) {
                        setState(() {
                          isValid = EmailValidator.validate(value);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          isValid ? 'Email is valid.' : 'Email is not valid.'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                passwordField(),
                SizedBox(height: 25),
                ButtonCustom(
                  text: "Login",
                  onPress: () async {
                    ResponseModel response = await Services().login(
                        emailController.text, passwordController.text, true);
                    if (response.hasError) {}
                    print(response);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Homepage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding passwordField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: isObscure,
        cursorColor: Colors.black,
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
            Icons.lock,
            color: KC.primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelStyle: TextStyle(color: KC.primaryColor),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: isObscure ? KC.primaryColor : KC.amber,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ),
          hintText: 'Password',
          labelText: 'Password',
        ),
      ),
    );
  }
}
