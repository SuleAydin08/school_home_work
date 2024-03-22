import 'package:flutter/material.dart';
import 'package:school_home_work/school_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuzladaki Okullar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 250, 249, 250)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SchoolPage(
          title: 'Tuzladaki Okulların Listesi'), //okulların getirleceği sayfa
    );
  }
}
