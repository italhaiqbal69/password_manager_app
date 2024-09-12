import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  User? currentuser = FirebaseAuth.instance.currentUser;

  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountEmailController = TextEditingController();
  TextEditingController accountPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              child: Lottie.asset('assets/Animation - 1707555885959.json'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: accountNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Account Name',
                  suffixIcon: Icon(Icons.account_box),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: accountEmailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  suffixIcon: Icon(Icons.email_outlined),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: accountPasswordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  suffixIcon: Icon(Icons.password_outlined),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  FirebaseFirestore.instance.collection('Passwords').doc().set({
                    'userAccount': accountNameController.text.trim(),
                    'userEmail': accountEmailController.text.trim(),
                    'userPassword': accountPasswordController.text.trim(),
                    'User_id': currentuser!.uid,
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  'Insert Data',
                  style: GoogleFonts.actor(
                      fontWeight: FontWeight.w200,
                      fontSize: 25,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// try {
//   await FirebaseFirestore.instance
//       .collection("Passwords")
//       .doc()
//       .set({
//     "Created at": DateTime.now(),
//     "userID": userID!.uid,
//     "Account_name": AccountName,
//     "Account_Email": AccountEmail,
//     "Account_Password": AccountPassword,
//   });
// } catch (e) {
//   print('Error $e');
// }
