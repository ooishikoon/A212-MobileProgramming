import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tutor/view/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY Tutor',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.oxygenTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MySplashScreen(title: 'MY Tutor'),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key, required String title}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (content) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/books.jpg'),
                      fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("MY Tutor",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                CircularProgressIndicator(),
                Text("Version 1.0",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
