import 'dart:convert';

import '../model/search_model.dart';
import 'package:http/http.dart' as http;

///搜索接口
class SearchDao {
  static Future<SearchModel> fetch(String url, String text) async {
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      //只有当当前输入的内容和服务端返回的内容一致时才渲染
      SearchModel model = SearchModel.fromJson(result);
      model.keyword = text;
      return model;
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}