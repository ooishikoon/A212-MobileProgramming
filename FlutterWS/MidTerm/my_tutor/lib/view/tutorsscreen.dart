import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_tutor/constants.dart';
import '../model/tutors.dart';
import '../model/user.dart';
import 'mainscreen.dart';
User user = User();

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  List<Tutors> tutorList = <Tutors>[];
  String titlecenter = "Loading...";

  late double screenHeight, screenWidth, resWidth;
  final df = DateFormat('dd/MM/yyyy hh:mm a');

  @override
  void initState() {
    super.initState();
    _loadTutors();
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
                                            builder: (content) => MainScreen(
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
            body: tutorList.isEmpty
                ? Center(
                    child: Text(titlecenter,
                        style: const TextStyle(
                          fontSize: 22,
                        )))
                : Column(children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 5),
                      child: Text("Tutors",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: (1 / 1),
                            children: List.generate(tutorList.length, (index) {
                              return InkWell(
                                splashColor: Colors.amber,
                                onTap: () => {_loadTutorsDetails(index)},
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
                                            flex: 7,
                                            child: CachedNetworkImage(
                                              imageUrl: CONSTANTS.server +
                                                  "/mytutor/mobile/assets/tutors/" +
                                                  tutorList[index]
                                                      .tutorId
                                                      .toString() +
                                                  '.jpg',
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
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  tutorList[index]
                                                      .tutorName
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

  _loadTutorsDetails(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text(
              "Tutor Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: CONSTANTS.server +
                      "/mytutor/mobile/assets/tutors/" +
                      tutorList[index].tutorId.toString() +
                      '.jpg',
                  fit: BoxFit.cover,
                  width: resWidth,
                  placeholder: (context, url) =>
                      const LinearProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                Text(
                  tutorList[index].tutorName.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    "Tutor ID: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tutorList[index].tutorId.toString(),
                  ),
                  const Text(
                    "\nTutor Email:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(tutorList[index].tutorEmail.toString()),
                  const Text(
                    "\nTutor Phone: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(tutorList[index].tutorPhone.toString()),
                  const Text(
                    "\nTutor Name:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(tutorList[index].tutorName.toString()),
                  const Text(
                    "\nTutor Description:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(tutorList[index].tutorDescription.toString()),
                  const Text(
                    "\nTutor Register Date:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(df.format(DateTime.parse(
                      tutorList[index].tutorDatereg.toString()))),
                ]),
              ],
            )),
          );
        });
  }
}
