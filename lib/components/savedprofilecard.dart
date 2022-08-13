part of homepage;

class SavedProfileCard extends StatefulWidget {
  SavedProfileCard({Key? key, required this.uid}) : super(key: key);

  String? uid;

  @override
  State<SavedProfileCard> createState() => _SavedProfileCardState();
}

class _SavedProfileCardState extends State<SavedProfileCard> {
  String? userid;
  late Stream<DocumentSnapshot> ref;

  @override
  void initState() {
    userid = widget.uid;
    ref = FirebaseFirestore.instance
        .collection("startup")
        .doc(userid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref, 
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        DocumentSnapshot data = snapshot.data! as DocumentSnapshot;
        return SingleChildScrollView(
          child: Container(
        
          ),
        );
      }
    );
  }
}
