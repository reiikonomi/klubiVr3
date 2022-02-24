// @dart = 2.9

import 'package:klubivr3/Blog/add_blog.dart';
import 'package:klubivr3/Pages/welcome_page.dart';
import 'package:klubivr3/Screen/home_screen.dart';
import 'package:klubivr3/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klubivr3/network_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentState = 0;
  List<Widget> widgets = [const HomeScreen(), const ProfileScreen()];
  List<String> titleString = ["Klubi", "Profili"];
  final storage = const FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();
  String username = "";
  Widget profilePhoto = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
  );

  @override
  void initState() {
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    var response = await networkHandler.get("/profile/checkProfile");
    setState(() {
      username = response['username'];
    });
    if (response["status"] == true) {
      setState(() {
        profilePhoto = CircleAvatar(
          radius: 50,
          backgroundImage: NetworkHandler().getImage(response['username']),
        );
      });
    } else {
      setState(() {
        profilePhoto = Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const String _url = 'https://www.instagram.com/onomdev/';

    // void _launchURL() async {
    //   if (!await launch(_url)) throw 'Could not launch $_url';
    // }

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    profilePhoto,
                    const SizedBox(
                      height: 10,
                    ),
                    Text("@$username"),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Feedback"),
                trailing: const Icon(Icons.feedback),
                onTap: () {
                  void _launchURL() async {
                    if (!await launch(_url)) throw 'Could not launch $_url';
                  }

                  _launchURL();
                },
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.power_settings_new),
                onTap: logout,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(titleString[currentState]),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddBlog()));
          },
          child: const Text(
            "+",
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: currentState == 0 ? Colors.white : Colors.white54,
                    onPressed: () {
                      setState(() {
                        currentState = 0;
                      });
                    },
                    iconSize: 40,
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    color: currentState == 1 ? Colors.white : Colors.white54,
                    onPressed: () {
                      setState(() {
                        currentState = 1;
                      });
                    },
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ),
        ),
        body: 
          widgets[currentState],
        );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
        (route) => false);
  }
}
