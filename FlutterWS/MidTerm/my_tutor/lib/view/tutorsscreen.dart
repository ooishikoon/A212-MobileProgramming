import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:my_tutor/constants.dart';

import '../model/tutors.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  List<Tutors> tutorList = <Tutors>[];
  String titlecenter = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadTutors();
  }

  @override
  Widget build(BuildContext context) {
    late double screenHeight, screenWidth, resWidth;

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
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (content) => MainScreen(
                                //               user: user,
                                //             )));
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
                              onTap: () {},
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
        body: tutorList.isEmpty
            ? Center(
                child: Text(titlecenter,
                    style: const TextStyle(
                      fontSize: 22,
                    )))
            : Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child:
                      Text("Tutors", style: TextStyle(fontSize: 18)),
                ),
                Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1),
                        children: List.generate(
                          tutorList.length,
                          (index) {
                            return Card();
                          },
                        )))
              ]));
  }

  void _loadTutors() {
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_tutors.php"),
        body: {}).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['tutors'] != null) {
          tutorList = <Tutors>[];
          extractdata['tutors'].forEach((v) {
            tutorList.add(Tutors.fromJson(v));
          });
          setState(() {});
        }
      }
    });
  }
}
