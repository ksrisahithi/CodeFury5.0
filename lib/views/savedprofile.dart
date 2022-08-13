part of homepage;

class ProfileSaved extends StatelessWidget {
  ProfileSaved({Key? key, required this.uid}) : super(key: key);

  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(flex: 6,child: SavedProfileCard(uid: uid,),),
          Flexible(flex: 2,child: Container(color: Colors.cyan,),),
        ],
      ),
    );
  }
}