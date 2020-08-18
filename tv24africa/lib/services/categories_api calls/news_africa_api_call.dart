import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpNewsAfricaPost() async {
  final response = await http.get(
      'https://news.tv24africa.com/wp-json/wp/v2/posts?filter[cat]=1078',
      headers: {"Accept": "application/json"}
      );

  var convertNewsAfricaDatatoJson = jsonDecode(response.body);
  return convertNewsAfricaDatatoJson;
  
}
