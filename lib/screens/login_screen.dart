import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:password_manager/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController LoginemailController = TextEditingController();
  TextEditingController LoginpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Login',
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
                child: Lottie.asset('assets/Animation - 1707024144087.json'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: LoginemailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: const Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: LoginpasswordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: const Icon(Icons.password_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  var LoginEmail = LoginemailController.text.trim();
                  var LoginPassword = LoginpasswordController.text.trim();

                  try {
                    final User? FirebaseUser = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: LoginEmail, password: LoginPassword))
                        .user;
                    if (FirebaseUser != null) {
                      Get.to(() => HomeScreen());
                    } else {
                      print('check email and password');
                    }
                  } on FirebaseAuthException catch (e) {
                    print("error $e");
                  }
                },
                child: Container(
                  height: 50,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'Login',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forget Password ?',
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Dont Have an acoount?'),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        'Sign Up',
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
