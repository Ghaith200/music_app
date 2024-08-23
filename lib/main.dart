import 'package:flutter/material.dart';
import 'package:music_app/api/api_manger.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/my_components/custom_app_bar.dart';
import 'package:music_app/homepage.dart';
import 'package:music_app/my_components/myButtomNavBar.dart';
import 'package:music_app/playlist.dart';
import 'package:music_app/account.dart';

void main() async {
  setup();
  Api1 api = Api1();
  await api.getRecommended();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1; // Default to Homepage

  final List<Widget> _listwidget = [
    Playlist(showBackArrow: false), // Index 2, no back arrow
    const Homepage(), // Index 1
    AccountScreen(), // Index 0
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _selectedIndex == 1 // Show AppBar only on Homepage
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: MyAppBar(),
              )
            : null,
        body: _listwidget.elementAt(_selectedIndex),
        bottomNavigationBar: Mybuttomnavbar(
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemTapped,
        ),
      ),
    );
  }
}
