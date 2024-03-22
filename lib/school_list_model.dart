class SchoolModel {
  String schoolName;
  String schoolAddress;
  String schoolPhone;
  String schoolFax;
  String schoolWebAddress;
  String schoolCompanyName;

  SchoolModel({
    required this.schoolName,
    required this.schoolAddress,
    required this.schoolPhone,
    required this.schoolFax,
    required this.schoolWebAddress,
    required this.schoolCompanyName,
  });
}
  // color: school["KURUM TUR ADI"] == 'İlkokul'
  //                   ? const Color.fromARGB(255, 163, 213, 254) //ilk koluşu soktun ? else dedin sonra hangi renk olması gerekiyorsa onu verdin d
  //                   : school["KURUM TUR ADI"] == 'İmam Hatip Ortaokulu'
  //                   ? Color.fromARGB(255, 166, 249, 169)
  //                       //ikinci veya daha fazla koşulda ise yine ne olması gerekiyorsa koşulu oluşturdun sonra renk verdin
  //                   : school["KURUM TUR ADI"] == 'Ortaokul'
  //                   ? Color.fromARGB(255, 163, 213, 254)
  //                   : school["KURUM TUR ADI"] == 'Anaokulu'
  //                   ? Color.fromARGB(255, 163, 213, 254)
  //                   : Colors.white, //: dedikten sonr da else demiş olurz bu da default yani bu koşulların dışında olan değerlere uygulanacak işlemleri yazarız.
