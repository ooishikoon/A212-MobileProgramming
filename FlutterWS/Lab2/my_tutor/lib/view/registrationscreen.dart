import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/registration.png'),
                      fit: BoxFit.cover))),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 10, 20, 25),
                    child: Column(
                      children: const <Widget>[
                        Text(
                          "Register New Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          /*Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(25, 10, 20, 25),
                      child: Column(
                        children: const <Widget>[
                          Text(
                            "Register New Account",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
