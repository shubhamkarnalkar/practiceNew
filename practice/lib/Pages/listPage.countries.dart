import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:practice/api/model.airline.dart';

class ListOfCountries extends StatefulWidget {
  const ListOfCountries({super.key});

  @override
  State<ListOfCountries> createState() => _ListOfCountriesState();
}

class _ListOfCountriesState extends State<ListOfCountries> {
  List<Airline> arlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arlist = Get.arguments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: arlist.length.toInt(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              title: Text(arlist[index].country.toString()),
              trailing: Text(
                arlist[index].name.toString(),
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            );
          }),
    );
  }
}
