part of homepage;

class Incubator extends StatelessWidget {
  Incubator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is the Incubators Directory, here you can submit your ideas and call for Incubators to nest your project',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 40),
        ),
      ),
    );
  }
}