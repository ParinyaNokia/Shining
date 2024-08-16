// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:testgrandle/model/gold.dart';

// void getgolddata() {
//   GoldData? gold;

//   Future<GoldData?> getGold() async {
//     final response =
//         await http.get(Uri.parse("https://chinhuaheng.com/gold/now"));

//     if (response.statusCode == 200) {
//       print(response.body);
//       return GoldData.fromJson(json.decode(response.body));
//     } else {
//       print("Error: Status :${response.statusCode}");
//     }
//   }
// }
