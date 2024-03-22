import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_home_work/school_detail_page.dart';


class SchoolWidget extends StatefulWidget {
  const SchoolWidget({
    super.key,
  });

  @override
  State<SchoolWidget> createState() => _SchoolWidgetState();
}

class _SchoolWidgetState extends State<SchoolWidget> {
  List<Map<String, dynamic>> schoolList =
      []; //burda listeyi çağırmamızın sebebi urlde map içerisinde liste olmasıdır.

  Future<void> getSchoolList() async {
    String url =
        "https://veri.tuzla.bel.tr/api/3/action/datastore_search?resource_id=9f526812-6f2e-4755-8712-52a18d4d6109";
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        List<dynamic> records = responseData['result']['records'];
        setState(() {
          schoolList = List<Map<String, dynamic>>.from(records);
        });
      } else {
        throw Exception('Failed to load school List');
      }
    } catch (e) {
      if (kDebugMode) {
        print("e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getSchoolList();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: schoolList.length,
        itemBuilder: (BuildContext context, int index) {
          var school = schoolList[index];
          //Detay sayfasına tıklama özelliği verilen ve yönlendirme yapılan sayfa
          return GestureDetector(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SchoolDetailPage(sList: school, 
               
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 246, 245, 243),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              // color: school["KURUM TUR ADI"] == 'İlkokul'
              //   ? Colors.cyan
              //   : Colors.deepOrange,   -> Burada tek koşul koyarken bu şekşlde yapabilrisn
              color: school["KURUM TUR ADI"] == 'İlkokul'
                  ? const Color.fromARGB(255, 163, 213,
                      254) //ilk koluşu soktun ? else dedin sonra hangi renk olması gerekiyorsa onu verdin d
                  : school["KURUM TUR ADI"] == 'İmam Hatip Ortaokulu'
                      ? const Color.fromARGB(255, 166, 249, 169)
                      //ikinci veya daha fazla koşulda ise yine ne olması gerekiyorsa koşulu oluşturdun sonra renk verdin
                      : school["KURUM TUR ADI"] == 'Ortaokul'
                          ? const Color.fromARGB(255, 163, 213, 254)
                          : school["KURUM TUR ADI"] == 'Anaokulu'
                              ? const Color.fromARGB(255, 163, 213, 254)
                              : Colors
                                  .white, //: dedikten sonr da else demiş olurz bu da default yani bu koşulların dışında olan değerlere uygulanacak işlemleri yazarız.
          
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, //yazıları başa yaslamak için
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Text(
                      school["OKUL ADI"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.5),
                  //   child: Text(
                  //     school["ADRES"],
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.5),
                  //   child: Text(
                  //     school["TELEFON"],
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.5),
                  //   child: Text(
                  //     school["FAX"],
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.5),
                  //   child: Text(
                  //     school["WEB ADRES"],
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.5),
                  //   child: Text(
                  //     school[
                  //         "KURUM TUR ADI"], //verilerin isimleri urldeki gibi olmalıdır null döner yoksa
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 10,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                      child: Icon(
                          school["KURUM TUR ADI"] == "İmam Hatip Ortaokulu"
                              ? Icons.mosque
                              : school["KURUM TUR ADI"] == "İmam Hatip Lisesi"
                                  ? Icons.mosque
                                  : school["KURUM TUR ADI"] ==
                                          "Anadolu İmam Hatip Lisesi"
                                      ? Icons.mosque
                                      : school["KURUM TUR ADI"] == "Ortaokul"
                                          ? Icons.child_care
                                          : school["KURUM TUR ADI"] == "İlkokul"
                                              ? Icons.child_care
                                              : Icons.school),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}
