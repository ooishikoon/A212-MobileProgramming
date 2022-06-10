import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_tutor/model/courses.dart';
import 'package:my_tutor/model/user.dart';
import 'package:my_tutor/view/tutorsscreen.dart';
import '../constants.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Courses> courseList = <Courses>[];
  String titlecenter = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadCourses();
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
                                //         builder: (BuildContext context) =>
                                //             MainScreen(
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
        body: courseList.isEmpty
            ? Center(
                child: Text(titlecenter,
                    style: const TextStyle(
                      fontSize: 22,
                    )))
            : Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 5),
                  child: Text("Courses",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1),
                        children: List.generate(courseList.length, (index) {
                          return InkWell(
                            splashColor: Colors.amber,
                            onTap: () => {_loadCoursesDetails(index)},
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.amber,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 247, 242, 199),
                                        Color.fromARGB(255, 243, 204, 86)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 6,
                                        child: CachedNetworkImage(
                                          imageUrl: CONSTANTS.server +
                                              "/mytutor/mobile/assets/courses/" +
                                              courseList[index]
                                                  .subjectId
                                                  .toString() +
                                              '.png',
                                          fit: BoxFit.cover,
                                          width: resWidth,
                                          placeholder: (context, url) =>
                                              const LinearProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Flexible(
                                        flex: 4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              courseList[index]
                                                  .subjectName
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  )),
                            ),
                          );
                        }))),
              ]));
  }

  void _loadCourses() {
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_courses.php"),
        body: {}).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['courses'] != null) {
          courseList = <Courses>[];
          extractdata['courses'].forEach((v) {
            courseList.add(Courses.fromJson(v));
          });
          setState(() {});
        }
      }
    });
  }

  _loadCoursesDetails(int index) {}

}
