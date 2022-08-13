part of loginpage;

CollectionReference startup = FirebaseFirestore.instance.collection("startup");
CollectionReference investor =
    FirebaseFirestore.instance.collection("investor");
CollectionReference corporation =
    FirebaseFirestore.instance.collection("corporation");
CollectionReference incubator =
    FirebaseFirestore.instance.collection("incubator");
CollectionReference accelerator =
    FirebaseFirestore.instance.collection("accelerator");
CollectionReference mentor = FirebaseFirestore.instance.collection("mentor");

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print("no user found with this email");
      return false;
    } else if (e.code == 'wrong-password') {
      print("wrong password");
      return false;
    }
    return false;
  }
}

Future<bool> register(
    String email, String password, String name, String type) async {
  User? user;
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    await user!.updateDisplayName(name);
    await user.reload();
    user = auth.currentUser;
    var userdata = {'name': name, 'email': email, 'type': type};
    if (type == "StartUp") {
      startup.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          startup.doc(user?.uid).set(userdata);
        }
      });
    } else if (type == 'Investor') {
      investor.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          investor.doc(user?.uid).set(userdata);
        }
      });
    } else if (type == 'Incubator') {
      incubator.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          incubator.doc(user?.uid).set(userdata);
        }
      });
    } else if (type == 'Accelerator') {
      accelerator.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          accelerator.doc(user?.uid).set(userdata);
        }
      });
    } else if (type == 'Corporation') {
      corporation.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          corporation.doc(user?.uid).set(userdata);
        }
      });
    } else if (type == 'Mentor') {
      mentor.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userdata);
        } else {
          mentor.doc(user?.uid).set(userdata);
        }
      });
    }
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
