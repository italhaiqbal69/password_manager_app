// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:password_manager/models/ColourLovers.dart';
//
// class Movies extends StatefulWidget {
//   const Movies({super.key});
//
//   @override
//   State<Movies> createState() => _MoviesState();
// }
//
// class _MoviesState extends State<Movies> {
//   List<ColorsModel> colorApi = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//                 future: getColorsApi(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: colorApi.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: Container(
//                               height: 400,
//                               width: 200,
//                               color: Colors.white,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text('Id: ${colorApi[index].id.toString()}'),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Text(
//                                           'Title: ${colorApi[index].title.toString()}'),
//                                       Text(
//                                           'Name: ${colorApi[index].userName.toString()}'),
//                                     ],
//                                   ),
//                                   Text(
//                                       'Date of Creation: ${colorApi[index].dateCreated.toString()}'),
//                                   Image.network(
//                                       colorApi[index].badgeUrl.toString()),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text(
//                                           'Red: ${colorApi[index].rgb!.red.toString()}'),
//                                       Text(
//                                           'Green: ${colorApi[index].rgb!.green.toString()}'),
//                                       Text(
//                                           'Blue: ${colorApi[index].rgb!.blue.toString()}'),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         });
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 }),
//           )
//         ],
//       ),
//     );
//   }
//
//   // Future<List<ColorsModel>> getColorsApi() async {
//   //   var baseUrl = 'https://www.colourlovers.com/api/colors/new?format=json';
//   //   final response = await http.get(Uri.parse(baseUrl));
//   //   var data = jsonDecode(response.body.toString());
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     for (Map i in data) {
//   //       colorApi.add(ColorsModel.fromJson(i));
//   //     }
//   //     return colorApi;
//   //   }
//   //   return [];
//   // }
// }
