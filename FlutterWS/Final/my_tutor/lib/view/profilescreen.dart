import 'package:flutter/material.dart';
import 'package:my_tutor/view/mainscreen.dart';
import 'package:my_tutor/view/tutorsscreen.dart';
import '../model/user.dart';

User user = User();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double screenHeight, screenWidth, resWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 1,
                    child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainScreen(
                                            user: user,
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.menu_book),
                                Text("Courses"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const TutorsScreen()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.person),
                                Text("Tutors"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.subscriptions),
                                Text("Subscribe"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.favorite),
                                Text("Favourite"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ProfileScreen()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.category),
                                Text("Profile"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/profilescreen.png'),
                      fit: BoxFit.cover))),
        ],
      ),
    );
  }
}
