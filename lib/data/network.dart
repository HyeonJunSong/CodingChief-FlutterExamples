// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class Network{
  final String url;
  Network(
    this.url,
  );

  Future<dynamic> getJson() async {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return(jsonDecode(response.body));
    }
    else{
      print(response.statusCode);
    }
  }
}