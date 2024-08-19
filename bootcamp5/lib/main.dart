import 'package:bootcamp5/model/task_model.dart';
import 'package:bootcamp5/pages/home_page.dart';
import 'package:bootcamp5/widgets/drawer.dart';
import 'package:bootcamp5/widgets/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Navbar());
  }
}
