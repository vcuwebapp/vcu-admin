import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/doubts/clrdoubt.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

class ChatDoubt extends StatefulWidget {
  const ChatDoubt({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<ChatDoubt> createState() => _ChatDoubtState();
}

class _ChatDoubtState extends State<ChatDoubt> {
  final TextEditingController topicController = TextEditingController();
  String dropdownvalue = 'Physics';
  final doubtsRef = FirebaseFirestore.instance;
  var items = [
    'Physics',
    'Chemistry',
    'Mathematics',
    'Biology',
    'EntPhysics',
    'EntChemistry',
    'EntMathematics',
    'EntBiology',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'View Doubts'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
            StreamBuilder(
                stream: doubtsRef
                    .collection("${dropdownvalue.toLowerCase()}doubts")
                    .where('name', isEqualTo: widget.name)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                        child: Text(
                      'No Data Is Available',
                      style: kContentHeadingStyle,
                    ));
                  }

                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((document) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ClearedDoubtCard(
                          doubt: document['doubt'],
                          stat: document['clearst'],
                        ),
                      );
                    }).toList(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
