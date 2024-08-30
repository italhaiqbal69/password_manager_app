import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:password_manager/screens/login_screen.dart';

import '../services/signup_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignUpUser(String userEmail, String userPassword, String userName,
      String userPhone) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'userName': userName,
        'userPhone': userPhone,
        'userEmail': userEmail,
        'create At': DateTime.now(),
        'userId': currentUser!.uid,
      }).then((value) => {
                FirebaseAuth.instance.signOut(),
                Get.to(() => LoginScreen()),
              });
    } on FirebaseAuthException catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController userPhoneController = TextEditingController();
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SignUp',
          style: GoogleFonts.actor(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                child: Lottie.asset('assets/Animation - 1707029521704.json'),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'UserName',
                    suffixIcon: Icon(Icons.verified_user),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: userPhoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    suffixIcon: Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: userPasswordController,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: Icon(Icons.password_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: userEmailController.text.trim(),
                            password: userPasswordController.text.trim())
                        .then((value) => {
                              SignUpUser(
                                  userEmailController.text.trim(),
                                  userPasswordController.text.trim(),
                                  userNameController.text.trim(),
                                  userPhoneController.text.trim())
                            });
                  },
                  child: Text(
                    'SignUp',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  ),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
