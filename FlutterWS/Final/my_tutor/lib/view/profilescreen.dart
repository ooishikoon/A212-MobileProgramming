import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_tutor/view/favouritescreen.dart';
import 'package:my_tutor/view/mainscreen.dart';
import 'package:my_tutor/view/settingscreen.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.user.name.toString();
    // _emailController.text = widget.user.email.toString();
  }

  // final user: widget.user;

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
                                            ProfileScreen()));
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
                  Align(alignment: Alignment.topRight, child: buildBookmark()),
                  buildProfile(),
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
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (content) => const SettingScreen()));
        },
      );

  Widget buildProfile() => Column(
        children: [
          SizedBox(
            // child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () => {},
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset('assets/images/avatar.png'),
                          // child: Image.network(CONSTANTS.server +
                          //     '/mytutor/mobile/assets/users/${widget.user.id}.jpg')
                          // child: CachedNetworkImage(imageUrl: CONSTANTS.server +
                          //             "/mytutor/mobile/assets/users/" +
                          //             widget.user.id.toString() +
                          //             '.jpg', )
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 16),
                          ),
                          // Text(widget.user.name.toString()),
                          // Text(widget.user.email.toString()),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainScreen(
                                        user: user,
                                      )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.emoji_people_outlined),
                            Text("Following"),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainScreen(
                                        user: user,
                                      )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.people_alt_outlined),
                            Text("Follower"),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainScreen(
                                        user: user,
                                      )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.message_outlined),
                            Text("Message"),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainScreen(
                                        user: user,
                                      )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.notification_important_outlined),
                            Text("Notifications"),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 8,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: GridView.count(
                      // 12 items
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      // 9 items
                      // crossAxisCount: 3,
                      // childAspectRatio: 1.5,
                      children: <Widget>[
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.download_outlined),
                                Text("Downlaod"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.bookmark_outline),
                                Text("Bookmark"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.history_outlined),
                                Text("History"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.playlist_play_outlined),
                                Text("Playlist"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.av_timer_outlined),
                                Text("Time off"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.task_outlined),
                                Text("Task"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.mode),
                                Text("Theme"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.account_balance_wallet_outlined),
                                Text("Wallet"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.view_list_outlined),
                                Text("Purchased"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.qr_code_scanner_outlined),
                                Text("Qr Scan"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.design_services_outlined),
                                Text("Services"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.help_center_outlined),
                                Text("Help"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: const Size(45, 45),
                          child: InkWell(
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
                                Icon(Icons.download_outlined),
                                Text("Downlaod"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
