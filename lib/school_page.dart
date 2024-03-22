import 'package:flutter/material.dart';
import 'package:school_home_work/school_widget.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key, required String title});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Scaffold sayfanın tümünü kapsar.
        appBar: AppBar(
          title: const Text(
            "Tuzla'daki Okullar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6),
            child: Container(
              color: Colors.black,
              height: 5,
            ),
          ),
        ),
        body: const SchoolWidget()); //listeyi göstereceğimiz yer
  }
}
