import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpInPics() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts?categories=91',
      headers: {"Accept": "application/json"}
      );

  var convertNewsAfricaDatatoJson = jsonDecode(response.body);
  return convertNewsAfricaDatatoJson;
  
}
