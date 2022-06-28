import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_tutor/view/mainscreen.dart';
import 'package:my_tutor/view/subscribescreen.dart';
import 'package:my_tutor/view/tutorsscreen.dart';
import '../constants.dart';
import '../model/user.dart';
import 'favouritescreen.dart';
import 'mainscreen.dart';
import 'tutorsscreen.dart';
import 'package:http/http.dart' as http;

User user = User();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SubscbribeScreen()));
                              },
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
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const FavouriteScreen()));
                              },
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
          children: [
            buildBackground(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight, child: buildBookmark()),
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
                    image: AssetImage('assets/images/profilescreen.png'),
                    fit: BoxFit.cover))),
      );

  Widget buildBookmark() => IconButton(
        icon: const Icon(
          Icons.settings,
          size: 40,
        ),
        onPressed: () {},
      );
}
