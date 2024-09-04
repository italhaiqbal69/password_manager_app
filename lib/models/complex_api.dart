import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:password_manager/models/newspaperModel.dart';
import 'package:http/http.dart' as http;

class NewsPaperApi extends StatefulWidget {
  const NewsPaperApi({super.key});

  @override
  State<NewsPaperApi> createState() => _NewsPaperApiState();
}

class _NewsPaperApiState extends State<NewsPaperApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Newspapers>>(
        future: getNewsApi(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Text(snapshot.data![index].lccn .toString()),
                  ),
                );
              });
        },
      ),
    );
  }

  Future<List<Newspapers>> getNewsApi() async {
    final response = await http
        .get(Uri.parse('https://chroniclingamerica.loc.gov/newspapers.json'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body.toString());
      print(response.body);
      var newsPaper = jsonResponse['newspapers'] as List;

      return newsPaper.map((item) => Newspapers.fromJson(item)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
