part of homepage;

class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key, required this.uid}) : super(key: key);

  String uid;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String? userid;
  late Stream<DocumentSnapshot> ref;
  String dropdownvalue = 'Ideating';
  var descontroller = TextEditingController();
  var yearsactive = TextEditingController();
  var fundscontroller = TextEditingController();
  var investmentcontroller = TextEditingController();
  var industrycontroller = TextEditingController();
  late List<String> stages;
  @override
  void initState() {
    userid = widget.uid;
    ref = FirebaseFirestore.instance
        .collection("startup")
        .doc(userid)
        .snapshots();
    stages = [
      "Ideating",
      "Concepting",
      "Committing",
      "Validating",
      "Scaling",
      "Establishing"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.hasData) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }
        DocumentSnapshot data = snapshot.data! as DocumentSnapshot;
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      data['name'],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data['email']),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  controller: descontroller,
                  maxLines: 6,
                  maxLength: 500,
                  decoration: InputDecoration(
                      hintText: "Enter the description of your startup",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: Text(
                        'Status',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownButton(
                        items: stages.map((String type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvalue = value!;
                          });
                        },
                        value: dropdownvalue,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: Text(
                        'No. of years active',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: yearsactive,
                        decoration: InputDecoration(
                            hintText: "active years of your startup",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: Text(
                        'Funds Available',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: fundscontroller,
                        decoration: InputDecoration(
                            hintText: "Funds",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: Text(
                        'Investment Required',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: investmentcontroller,
                        decoration: InputDecoration(
                            hintText: "Investment",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 15),
                      child: Text(
                        'Industry',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: industrycontroller,
                        decoration: InputDecoration(
                            hintText: "active years of your startup",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 39, 119),
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () async {
                        bool shouldNavigate = await save(descontroller.text, dropdownvalue , yearsactive.text, fundscontroller.text, industrycontroller.text, industrycontroller.text, userid!);
                        if (shouldNavigate) {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSaved(uid: userid!,),),);
                          });
                        }
                      },
                      child: const Text("Save",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
