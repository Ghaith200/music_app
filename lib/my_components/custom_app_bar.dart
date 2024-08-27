import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'Hello Ghaith ! ',
        style: TextStyle(color: Colors.white, fontFamily: "Nicemoji"),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/profiles/me.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
