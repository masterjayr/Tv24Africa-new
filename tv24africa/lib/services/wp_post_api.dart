import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPost() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts/?per_page=70',
      headers: {"Accept": "application/json"});

  var convertDatatoJson = jsonDecode(response.body);
  print('Converted data = ${convertDatatoJson.runtimeType}');
  return convertDatatoJson;
}
