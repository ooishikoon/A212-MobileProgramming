import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double screenHeight, screenWidth;
  bool remember = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: screenHeight / 2.5,
                      width: screenWidth,
                      child: Image.asset('assets/images/logo.png')),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          icon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(value: remember, onChanged: _onRememberMe),
                      const Text("Remember Me")
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: screenWidth,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text("Login"),
                        onPressed: _loginUser,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(child: Text(""))
          ],
        ),
      ),
    );
  }

  void _onRememberMe(bool? value) {
    setState(() {
      remember = value!;
    });
  }

  void _loginUser() {
    String _email = _emailController.text;
    String _password = _passwordController.text;
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.post(Uri.parse("http://10.31.83.198/mytutor/mobile/php/login_user.php"),
          body: {"email": _email, "password": _password}).then((response) {
        print(response.body);
      });
    }
  }
}
