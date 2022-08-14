part of homepage;

class Investor extends StatelessWidget {
  Investor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is the Investor Directory, here you can submit your ideas and call for Investors to invest in your project',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
      ),
    );
  }
}
