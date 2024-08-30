import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateScreen extends StatelessWidget {
  String? accountName;
  String? docId;

  UpdateScreen({super.key, required this.accountName, required this.docId});

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';

    TextEditingController updateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(accountName.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: updateController..text = "${accountName.toString()}",
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('Passwords')
                    .doc(docId.toString())
                    .update({
                  'userAccount': updateController.text.trim(),
                }).then((value) => {Get.back()});
              },
              child: Text('update')),

          //image Picking and Uploading

          ElevatedButton(
              onPressed: () async {

                // image picker
                ImagePicker imagePicker = ImagePicker();
                XFile? file =  await imagePicker.pickImage(source: ImageSource.gallery);
                print(file!.path);

                if (file == null) return;


               // Unique name for image
                String uniqueFilename =
                    DateTime.now().millisecondsSinceEpoch.toString();



                // uploading Image to firebase

                //Firebase storage instance
                Reference referenceRoot = FirebaseStorage.instance.ref();

                //create folder for images
                Reference referenceDirImages = referenceRoot.child('images');

                //Give pic a unique name
                Reference imagetoUpload =
                    referenceDirImages.child(uniqueFilename);


                //upload image to Firebase
                try {
                  await imagetoUpload.putFile(File(file!.path));
                  imageUrl = await imagetoUpload.getDownloadURL();
                  print(imageUrl);
                } catch (e) {
                  print(e);
                }

                // add link to the specific user doc
                FirebaseFirestore.instance
                    .collection('Passwords')
                    .doc(docId.toString())
                    .update({
                  'image': imageUrl,
                }).then((value) => {Get.back()});
              },
              child: Text('pic Upload')),
        ],
      ),
    );
  }
}
