part of homepage;

Future<bool> save(String description, String status, String years, String funds, String investment, String industry, String uid) async {
  DocumentReference ref = FirebaseFirestore.instance.collection('startup').doc(uid);
  try {
    var profiledata = {
      "description" : description,
      "status" : status,
      "active years" : years,
      "funds available" : funds,
      "investment required" : investment,
      "industry" : industry
    };
    ref.get().then((doc) {
      if (doc.exists) {
        ref.update(profiledata);
      }
      else {
        ref.set(profiledata);
      }
    });
    return true;
  }
  on FirebaseException catch (e) {
    print(e.code);
    return false;
  }
}