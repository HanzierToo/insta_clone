import 'package:flutter/material.dart';
import 'main.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: MyApp.lightBG,
        foregroundColor: MyApp.lightFG,
        titleSpacing: MediaQuery.of(context).size.width * 0.25 + 11,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}