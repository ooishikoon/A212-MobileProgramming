import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_tutor/model/courses.dart';
import 'package:my_tutor/model/user.dart';
import 'package:my_tutor/view/tutorsscreen.dart';
import '../constants.dart';

User user = User();

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
  var numofpage, curpage = 1;
  var color;
  late double screenHeight, screenWidth, resWidth;
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  void initState() {
    super.initState();
    _loadCourses(1, search);
  }

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
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: courseList.isEmpty
              ? Center(
                  child: Text(titlecenter,
                      style: const TextStyle(
                        fontSize: 22,
                      )))
              : Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 50, 0, 5),
                    child: Stack(
                      children: <Widget>[
                        const Center(
                          child: Text("Courses",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                              ),
                              onPressed: () {
                                _loadSearchDialog();
                              },
                            ))
                      ],
                    ),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
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
                                            errorWidget:
                                                (context, url, error) =>
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: numofpage,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if ((curpage - 1) == index) {
                          color = Colors.amber;
                        } else {
                          color = Colors.black;
                        }
                        return SizedBox(
                          width: 40,
                          child: TextButton(
                              onPressed: () => {_loadCourses(index + 1, "")},
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(color: color),
                              )),
                        );
                      },
                    ),
                  ),
                ])),
    );
  }

  void _loadCourses(int pageno, String _search) {
    curpage = pageno;
    numofpage ?? 1;
    http.post(
        Uri.parse(CONSTANTS.server + "/mytutor/mobile/php/load_courses.php"),
        body: {
          'pageno': pageno.toString(),
          'search': _search,
        }).then((response) {
      var jsondata = jsonDecode(response.body);
      print(jsondata);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        numofpage = int.parse(jsondata['numofpage']);

        if (extractdata['courses'] != null) {
          courseList = <Courses>[];
          extractdata['courses'].forEach((v) {
            courseList.add(Courses.fromJson(v));
          });
          setState(() {});
        } else {
          titlecenter = "No Courses Available";
          setState(() {});
        }
      }
    });
  }

  _loadCoursesDetails(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text(
              "Courses Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: CONSTANTS.server +
                      "/mytutor/mobile/assets/courses/" +
                      courseList[index].subjectId.toString() +
                      '.png',
                  fit: BoxFit.cover,
                  width: resWidth,
                  placeholder: (context, url) =>
                      const LinearProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                Text(
                  courseList[index].subjectName.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    "Subject ID: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    courseList[index].subjectId.toString(),
                  ),
                  const Text(
                    "\nSubject Description:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(courseList[index].subjectDescription.toString()),
                  const Text(
                    "\nSubject Price: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("RM " +
                      double.parse(courseList[index].subjectPrice.toString())
                          .toStringAsFixed(2)),
                  const Text(
                    "\nSubject Session:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(courseList[index].subjectSessions.toString()),
                  const Text(
                    "\nSubject Rating:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(courseList[index].subjectRating.toString()),
                ]),
              ],
            )),
          );
        });
  }

  void _loadSearchDialog() {
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "Search Courses",
                ),
                content: SizedBox(
                  height: screenHeight / 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: 'Search',
                            suffixIcon: IconButton(
                              onPressed: () => searchController.clear(),
                              icon: const Icon(Icons.clear),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      search = searchController.text;
                      Navigator.of(context).pop();
                      _loadCourses(1, search);
                    },
                    child: const Text("Search"),
                  )
                ],
              );
            },
          );
        });
  }
}
