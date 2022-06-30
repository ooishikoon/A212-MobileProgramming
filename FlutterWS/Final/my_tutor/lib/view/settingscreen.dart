import 'package:flutter/material.dart';
import 'package:my_tutor/view/profilescreen.dart';
import '../model/user.dart';
import 'mainscreen.dart';

User user = User();

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late double screenHeight, screenWidth, resWidth;
  String titlecenter = "Loading...";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            buildBackground(),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Stack(
                children: [
                  Align(alignment: Alignment.topLeft, child: buildBackButton()),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                        alignment: Alignment.topCenter, child: buildTitle()),
                  )
                ],
              ),
            ),
            buildEmptyCartMessage(),
          ],
        ),
      );

  Widget buildBackground() => ClipRRect(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/cartscreen.png'),
                    fit: BoxFit.cover))),
      );

  Widget buildTitle() => const Text("Setting",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold));

  Widget buildBackButton() => IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (content) => const ProfileScreen()));
        },
      );

  Widget buildEmptyCartMessage() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Setting List",
                style: TextStyle(fontSize: 20)),
          ],
        ),
      );
}
