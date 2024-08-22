import 'package:flutter/material.dart';

class Mybuttomnavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  Mybuttomnavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.deepOrangeAccent,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.filter_list), label: "Playlist"),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp), label: "Account"),
      ],
    );
  }
}
