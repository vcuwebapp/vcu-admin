import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/marks/indmarks/marks_card.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

class IndMarksScreen extends StatefulWidget {
  const IndMarksScreen({Key? key, required this.batchname, required this.name})
      : super(key: key);

  final String batchname;
  final String name;

  @override
  State<IndMarksScreen> createState() => _IndMarksScreenState();
}

class _IndMarksScreenState extends State<IndMarksScreen> {
  final marksRef = FirebaseFirestore.instance.collection("marks");

  String dropdownvalue = 'Physics';
  var items = [
    'Physics',
    'Chemistry',
    'Mathematics',
    'Biology',
  ];

  Future<void> getData() async {
    // Get docs from collection reference
    final marks = await marksRef.get();

    for (var mark in marks.docs) {
      print(mark.data());
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CtaAppbar(
          screenname: 'Marks',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // MarksCard(
                    //   subject: 'Physics',
                    //   date: '31-12-2022',
                    //   outof: '20',
                    //   marksobt: '20',
                    // ),
                    // MarksCard(
                    //   subject: 'Physics',
                    //   date: '31-12-2022',
                    //   outof: '20',
                    //   marksobt: '20',
                    // ),
                    // MarksCard(
                    //   subject: 'Physics',
                    //   date: '31-12-2022',
                    //   outof: '20',
                    //   marksobt: '20',
                    // ),
                    // MarksCard(
                    //   subject: 'Physics',
                    //   date: '31-12-2022',
                    //   outof: '20',
                    //   marksobt: '20',
                    // ),
                    Container(
                      width: 150,
                      height: 30,
                      child: DropdownButton(
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                        stream: marksRef
                            .doc(widget.batchname.toLowerCase())
                            .collection(dropdownvalue.toLowerCase())
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          print(widget.batchname.toLowerCase());
                          print(dropdownvalue.toLowerCase());
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
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs.map((document) {
                              return IndMarksCard(
                                  subject: document['subject'],
                                  date: document['date'],
                                  marksobt: document[widget.name],
                                  outof: document['totalmarks']);
                            }).toList(),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
