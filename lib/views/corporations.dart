part of homepage;

class Corporation extends StatelessWidget {
  Corporation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is the Corporations Directory, here you can submit your ideas and call for Corporations to fund your project',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 40),
        ),
      ),
    );
  }
}