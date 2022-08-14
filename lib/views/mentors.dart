part of homepage;

class Mentor extends StatelessWidget {
  Mentor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is the Mentors Directory, here you can submit your request and call for Mentors to guide your project',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 40),
        ),
      ),
    );
  }
}