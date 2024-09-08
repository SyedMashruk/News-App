import 'package:flutter/material.dart';
import 'package:news/widgets/custom/custom_navigation_bar.dart';

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
      home: const CustomNavigationBar(selectedColor: [
        Color(0xffa18249),
        Color.fromARGB(255, 206, 166, 93),
      ]),
    );
  }
}
