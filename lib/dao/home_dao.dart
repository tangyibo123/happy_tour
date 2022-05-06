


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:happy_tour/model/home_model.dart';

class HomeDao {
  static Future<HomeModel> fetch() async {
    String homeString = await rootBundle.loadString("json/home_page.json");
    //Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
    var homeJson = json.decode(homeString);

    return HomeModel.fromJson(homeJson);
  }


}