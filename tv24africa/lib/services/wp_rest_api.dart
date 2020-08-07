import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPost() async {
  final response = await http.get('https://tv24africa.com/wp-json/wp/v2/categories/47',
      headers: {"Accept": "application/json"});
  var toJson = jsonDecode(response.body);
  return toJson;
}
