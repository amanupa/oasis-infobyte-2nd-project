import 'package:flutter/material.dart';
import 'package:unitconvertor_app/firstPage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Unit"),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: const ConverUnit(),
      ),
    );
  }
}
