part of homepage;

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
                size: 32,
              ),
              label: Text(
                'Go to Home Page',
                style: TextStyle(fontSize: 20),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Text('Chat Box'),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.message,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey
          ),
          margin: const EdgeInsets.all(8),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey
          ),
          margin: const EdgeInsets.all(8),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey
          ),
          margin: const EdgeInsets.all(8),
        ),
      ],
    );
  }
}
