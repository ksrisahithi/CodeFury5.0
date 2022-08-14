library homepage;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part '../components/profilecard.dart';
part '../components/savedprofilecard.dart';
part '../components/sidebar.dart';

part '../controller/profile.dart';

part '../views/savedprofile.dart';
part '../views/dashboard.dart';
part '../views/investor.dart';
part '../views/accelerators.dart';
part '../views/incubators.dart';
part '../views/mentors.dart';
part '../views/corporations.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Home Page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileSaved(uid: userid)));
                    },
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Stake Holders',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Investor()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: Center(child: Text('Investors')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Mentor()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: Center(child: Text('Mentors')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Incubator()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: Center(child: Text('Incubators')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Accelerator()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: Center(child: Text('Accelerators')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Corporation()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: Center(child: Text('Corporations')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
