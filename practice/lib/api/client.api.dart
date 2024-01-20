import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ClientApi {
  var client = http.Client();

//Get request
  Future<dynamic> get(String baseUrl) async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      debugPrint('Error');
    }
  }

//Post request
  Future<dynamic> post(String baseUrl, String endpoint, dynamic object) async {
    var url = Uri.parse(baseUrl + endpoint);
    var payload = json.encode(object);
    dynamic headers = {'Content-Type': 'Application/json'};
    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      debugPrint('Error');
    }
  }
}
