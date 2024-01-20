import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:practice/api/model.users.dart';
import 'package:practice/constants.api.dart';

import 'Pages/listPage.countries.dart';
import 'api/client.api.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  var client = ClientApi();
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: getCountry,
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 191, 168, 84),
            ),
            child: const Text('Get'),
          ),
          TextButton(
            onPressed: callApi,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            child: const Text('Another link'),
          ),
          TextButton(
            onPressed: users,
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 191, 168, 84),
            ),
            child: const Text('JSON View Link'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 191, 168, 84),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> callApi() async {
    var response = await fetchAlbum();
  }

  Future<void> getCountry() async {
    var jsonbody =
        await client.get(ApiConstants.airlineBaseUrl).catchError((err) {
      debugPrint('error in api call');
    });
    if (jsonbody == null) {
      return;
    } else {
      debugPrint('Success');
      List<dynamic> list = jsonDecode(jsonbody.toString());
      // var arlist = Airline.fromJson(list);
      Get.to(const ListOfCountries(), arguments: list);
    }
  }

  Future<void> users() async {
    var jsonbody =
        await client.get(ApiConstants.usersBaseUrl).catchError((err) {
      debugPrint('error in api call is: $err');
    });
    if (jsonbody == null) {
      return;
    } else {
      debugPrint('Success');
      List<UsersModel> userList;
      userList = (json.decode(jsonbody) as List)
          .map((e) => UsersModel.fromJson(e))
          .toList();
      Get.to(const ListOfCountries(), arguments: userList);
    }
  }
}
