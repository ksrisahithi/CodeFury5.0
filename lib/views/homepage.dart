library homepage;

import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part '../components/profilecard.dart';
part '../components/savedprofilecard.dart';

part '../controller/profile.dart';

part '../views/savedprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 6,
            child: ProfileCard(
              uid: userid,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(color: Colors.tealAccent,),
          ),
        ],
      ),
    );
  }
}
