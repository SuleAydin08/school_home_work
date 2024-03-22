// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SchoolDetailPage extends StatefulWidget {
  SchoolDetailPage({super.key, required this.sList});
  var sList; //Bunu belirtmezsek verileri çekerken sıkıntı yaşarız

  @override
  State<SchoolDetailPage> createState() => _SchoolDetailPageState();
}

class _SchoolDetailPageState extends State<SchoolDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Okul Detayı",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
         padding: EdgeInsets.all(15),
          width: 400,
          height: 400,
          decoration: BoxDecoration(//container içerisinde box decoration kullandığımız zaman renk ve RENK KOŞULUNUDA bunun içerisinde tanımlalamamız gerekir
             color: widget.sList["KURUM TUR ADI"] == 'İlkokul' ? Color.fromARGB(255, 163, 213,254)
          :widget.sList["KURUM TUR ADI"] == 'Ortaokul' ? const Color.fromARGB(255, 163, 213, 254)
          :widget.sList["KURUM TUR ADI"] == 'Anaokulu' ? const Color.fromARGB(255, 163, 213, 254)
          :widget.sList["KURUM TUR ADI"] == 'İmam Hatip Ortaokulu' ? const Color.fromARGB(255, 166, 249, 169):Colors.white,
            
            border: Border.all(
              color: Colors.black,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, //yazıları başa yaslamak için
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.sList["OKUL ADI"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.sList["ADRES"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.sList["TELEFON"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.sList["FAX"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.sList["WEB ADRES"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.sList["KURUM TUR ADI"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: Icon(widget.sList["KURUM TUR ADI"] == "İlkokul" ? Icons.child_care :
                widget.sList["KURUM TUR ADI"] == "Ortaokul" ? Icons.child_care:
                widget.sList["OKUL TUR ADI"] == "Anaokulu" ? Icons.child_care:
                widget.sList["OKUL TUR ADI"] == "Anadolu İmam Hatip Lisesi" ? Icons.mosque:
                widget.sList["OKUL TUR ADI"] == "İmam Hatip Lisesi" ? Icons.mosque:
                widget.sList["OKUL TUR ADI"] == "İmam Hatip Ortaokulu" ? Icons.mosque:Icons.school,size: 100,),
              ),),
            ]
          ),
        ),
      ),
    );
  }
}
