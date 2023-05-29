import 'package:flutter/material.dart';
import 'package:text_link/text_link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Link',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Link'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinkText(
                text: "Check out https://www.void.krd for more information.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
