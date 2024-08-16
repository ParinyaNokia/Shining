import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testgrandle/model/gold.dart';

class GoldProvider with ChangeNotifier {
  GoldData? goldDataModel;

  GoldData? get goldData => goldDataModel;

  Future<void> getGoldData() async {
    try {
      final response =
          await http.get(Uri.parse("https://chinhuaheng.com/gold/now"));
      if (response.statusCode == 200) {
        print(response.body);
        goldDataModel = GoldData.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        print("fail: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
