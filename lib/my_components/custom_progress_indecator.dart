import 'package:flutter/material.dart';

class CustomProgressIndecator extends StatefulWidget {
  const CustomProgressIndecator({super.key});

  @override
  State<CustomProgressIndecator> createState() =>
      _CustomProgressIndecatorState();
}

class _CustomProgressIndecatorState extends State<CustomProgressIndecator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.orange,
        backgroundColor: Colors.black,
      ),
    );
  }
}
