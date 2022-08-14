part of homepage;

class Accelerator extends StatelessWidget {
  Accelerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is the Accelerators Directory, here you can submit your ideas and call for Accelerators to accelerate in your project',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 40),
        ),
      ),
    );
  }
}