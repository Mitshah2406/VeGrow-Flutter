import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Center(
            child: Text("Welcome "),
          ),
        ],
      ),
    );
  }
}
