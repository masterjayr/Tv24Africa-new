import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpBusinessPost() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts?filter[cat]=77',
      headers: {"Accept": "application/json"});

  var convertBusinessDatatoJson = jsonDecode(response.body);
  return convertBusinessDatatoJson;
  
}
