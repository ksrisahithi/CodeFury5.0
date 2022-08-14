part of loginpage;

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: Image(image: AssetImage('assets/images/illustration-6.png')),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: RegisterCard(),
            ),
          ),
        ],
      ),
    );
  }
}

