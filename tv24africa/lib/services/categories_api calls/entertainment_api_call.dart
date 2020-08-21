import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpEntertainPost() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts?categories=93',
      headers: {"Accept": "application/json"});

  var convertEntertainDatatoJson = jsonDecode(response.body);
  return convertEntertainDatatoJson;
  
}
