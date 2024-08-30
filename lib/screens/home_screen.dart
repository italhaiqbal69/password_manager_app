import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:password_manager/screens/login_screen.dart';
import 'package:password_manager/screens/picScreen.dart';
import 'package:password_manager/screens/save_password_screen.dart';
import 'package:password_manager/screens/update_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Passwords'),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.off(() => const LoginScreen());
              },
              child: const Icon(Icons.door_back_door_outlined)),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            child: Lottie.asset('assets/Animation - 1707548581783.json'),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Passwords')
                    .where("User_id", isEqualTo: userid!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text('No data found');
                  }
                  if (snapshot != null && snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, Index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                title: Text(
                                  snapshot.data!.docs[Index]['userAccount'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  snapshot.data!.docs[Index]['userPassword'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.yellowAccent),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        var docid =
                                            snapshot.data!.docs[Index].id;
                                        Get.to(() => UpdateScreen(
                                            accountName: snapshot.data!
                                                .docs[Index]['userAccount'],
                                            docId: docid));
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection('Passwords')
                                            .doc(snapshot.data!.docs[Index].id)
                                            .delete();
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }

                  return CircularProgressIndicator();
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddPasswordScreen());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
