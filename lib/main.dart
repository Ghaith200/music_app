import 'package:flutter/material.dart';
import 'api/api_manger.dart';
import 'locator.dart';
import 'my_components/custom_app_bar.dart';
import 'homepage.dart';
import 'my_components/custom_progress_indecator.dart';
import 'my_components/myButtomNavBar.dart';
import 'Pages/playlist.dart';
import 'Pages/account.dart';

void main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1; // Default to Homepage
  bool _isLoading = true; // Track loading state

  final List<Widget> _listwidget = [
    const Playlist(showBackArrow: false), // Index 2, no back arrow
    const Homepage(), // Index 1
    const AccountScreen(), // Index 0
  ];

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the app starts
  }

  void _fetchData() async {
    ApiManger api = ApiManger();
    await api.getArtists();
    await api.gethome();
    await api.getRecommended();
    await api.getPlaylist();
    await api.getTodaysBigestHits();

    setState(() {
      _isLoading = false;
    });
  }

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
        appBar: _selectedIndex == 1
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: MyAppBar(),
              )
            : null,
        body: _isLoading // Show a progress indicator while loading
            ? Container(
                color: Colors.black,
                child: const Center(child: CustomProgressIndecator()),
              )
            : _listwidget.elementAt(_selectedIndex),
        bottomNavigationBar:
            _isLoading // Disable bottom navigation while loading
                ? null
                : Mybuttomnavbar(
                    selectedIndex: _selectedIndex,
                    onItemSelected: _onItemTapped,
                  ),
      ),
    );
  }
}
