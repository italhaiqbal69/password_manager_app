import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:password_manager/models/newspaperModel.dart';

class ComplexApi extends StatefulWidget {
  const ComplexApi({super.key});

  @override
  State<ComplexApi> createState() => _ComplexApiState();
}

class _ComplexApiState extends State<ComplexApi> {
  Future<List<Newspapers>> getNewspaper() async {
    final response = await http
        .get(Uri.parse('https://chroniclingamerica.loc.gov/newspapers.json'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse.toString());
      var newspaper = jsonResponse['newspapers'] as List;
      return newspaper.map((item) => Newspapers.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load currencies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Newspapers>>(
        future: getNewspaper(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var news = snapshot.data![index];
                  return Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        Text(news.lccn.toString()),
                        Text(news.url.toString()),
                        Text(news.state.toString()),
                        Text(news.title.toString()),
                      ],
                    ),
                  );
                });
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
