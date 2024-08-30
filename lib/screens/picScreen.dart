// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageUploading extends StatefulWidget {
//   const ImageUploading({super.key});
//
//   @override
//   State<ImageUploading> createState() => _ImageUploadingState();
// }
//
// class _ImageUploadingState extends State<ImageUploading> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   ImagePicker imagePicker = ImagePicker();
//                   XFile? file =
//                       await imagePicker.pickImage(source: ImageSource.gallery);
//                   print(file!.path);
//
//                   if (file == null) return;
//
//                   String uniqueFilename =
//                       DateTime.now().millisecondsSinceEpoch.toString();
//
//                   Reference referenceRoot = FirebaseStorage.instance.ref();
//                   Reference referenceDirImages = referenceRoot.child('images');
//
//                   Reference imagetoUpload =
//                       referenceDirImages.child(uniqueFilename);
//
//                   try {
//                     await imagetoUpload.putFile(File(file!.path));
//                     imageUrl = await imagetoUpload.getDownloadURL();
//                     print(imageUrl);
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Text('pick')),
//
//             ElevatedButton(onPressed: (){
//               FirebaseFirestore.instance.collection('Passwords').add({
//                 'image':imageUrl,
//               });
//             }, child: Text('Upload'))
//
//           ],
//         ),
//       ),
//     );
//   }
// }
