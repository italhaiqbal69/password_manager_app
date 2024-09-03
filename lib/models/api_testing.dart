import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:password_manager/models/ColourLovers.dart';

class ApiTesting extends StatefulWidget {
  const ApiTesting({super.key});

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  List<ColorsModel> favColors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getColorApi(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: favColors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 400,
                    color: Colors.yellowAccent,
                    child: Column(
                      children: [
                        Text(
                          favColors[index].title.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          favColors[index].userName.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                        Image.network(favColors[index].badgeUrl.toString()),
                        Text(
                          favColors[index].rgb!.red.toString(),
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Future<List<ColorsModel>> getColorApi() async {
    final response = await http.get(
        Uri.parse('https://www.colourlovers.com/api/colors/new?format=json'));
    var data = jsonDecode(response.body.toString());
    print(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        favColors.add(ColorsModel.fromJson(i));
      }
      return favColors;
    }
    return [];
  }
}
