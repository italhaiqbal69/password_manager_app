import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:password_manager/models/ColourLovers.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Data>>(
                future: getCurrencies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var currency = snapshot.data![index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Text(currency.id.toString()),
                                  Text(currency.name.toString()),
                                  Text(currency.minSize.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Future<List<Data>> getCurrencies() async {
    var url = 'https://api.coinbase.com/v2/currencies';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse.toString());
      var data = jsonResponse['data'] as List;
      return data.map((item) => Data.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load currencies');
    }
  }
}
