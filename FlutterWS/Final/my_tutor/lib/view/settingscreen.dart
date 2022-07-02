import 'package:flutter/material.dart';
import 'package:my_tutor/view/profilescreen.dart';
import '../model/user.dart';

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
        drawerEdgeDragWidth: screenWidth = MediaQuery.of(context).size.width,
        body: Stack(
          children: [
            buildBackground(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Stack(
                children: [
                  Align(alignment: Alignment.topLeft, child: buildBackButton()),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: buildTitle(),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: buildSettingList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildBackground() => ClipRRect(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/settingscreen.png'),
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

  Widget buildSettingList() => Container(
        width: screenWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 245, 240, 192),
                        Color.fromARGB(255, 245, 243, 240)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () => {},
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset('assets/images/avatar.png'),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'UPDATE NAME',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'UPDATE PASSWORD',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'UPDATE EMAIL',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'UPDATE PHONE NO',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'UPDATE ADDRESS',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'LOG OUT',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  void _updateNameDialog() {}

  void _changePassDialog() {}

  void _updatePhoneDialog() {}

  void _updateAddressDialog() {}

  void _registerAccount() {}

  void _loginDialog() {}

  void _logoutDialog() {}
}
