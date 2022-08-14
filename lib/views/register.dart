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
              child: const Image(image: NetworkImage('https://github.com/ksrisahithi/CodeFury5.0/blob/main/assets/images/Illustration-6.png')),
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

