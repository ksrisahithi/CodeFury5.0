part of homepage;

class EditDashboard extends StatefulWidget {
  const EditDashboard({Key? key}) : super(key: key);

  @override
  State<EditDashboard> createState() => _EditDashboardState();
}

class _EditDashboardState extends State<EditDashboard> {
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
            child: SideBar(),
          ),
        ],
      ),
    );
  }
}
