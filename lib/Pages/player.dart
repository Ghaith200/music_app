import 'package:flutter/material.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: MaterialApp(
        home: Center(
          child: CustomProgressIndecator(),
        ),
      ),
    );
  }
}
