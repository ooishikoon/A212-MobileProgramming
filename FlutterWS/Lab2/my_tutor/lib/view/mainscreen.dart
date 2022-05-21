import 'package:flutter/material.dart';
import 'package:my_tutor/model/user.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY Tutor'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("OSK"),
              accountEmail: Text("skooi0307@hotmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN7aVEwAUVK0Uq7JTZqifhy8Q5zm1nC9LG3nyxwm4fAZAqCXMJr2qs5-hcsfxtppRbYcA&usqp=CAU"),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
