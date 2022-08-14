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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.amberAccent,
                        backgroundImage: Image(
                                image:
                                    AssetImage('assets/images/user_icon.png'))
                            .image,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data['name'],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                    child: Text(
                      'Email:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data['email']),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                    child: Text(
                      'Description:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data['description']),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                        child: Text(
                          'Status:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['status']),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                        child: Text(
                          'No. of years active:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['active years']),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                        child: Text(
                          'Funds Available:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['funds available']),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                        child: Text(
                          'Investment Required:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['investment required']),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                        child: Text(
                          'Industry:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data['industry']),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
