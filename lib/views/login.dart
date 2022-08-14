library loginpage;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefury/views/homepage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


part '../controller/auth.dart';

part 'register.dart';

part '../components/logincard.dart';
part '../components/registercard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: const Image(image: NetworkImage('https://github.com/ksrisahithi/CodeFury5.0/blob/main/assets/images/Illustration-1.png')),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LoginCard(),
            ),
          ),
        ],
      ),
    );
  }
}
