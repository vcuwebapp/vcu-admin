import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/marks/indmarks/indmarksscreen.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class MarksSortList extends StatefulWidget {
  const MarksSortList({Key? key}) : super(key: key);

  @override
  State<MarksSortList> createState() => _MarksSortListState();
}

class _MarksSortListState extends State<MarksSortList> {
  String dropdownvalue = 'XIRegular';

  final docRef = FirebaseFirestore.instance.collection("students");

  var items = [
    'XIRegular',
    'XIEngineering',
    'XIMedical',
    'XIIRegular',
    'XIIEngineering',
    'XIIMedical',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Marks'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    SingleChildScrollView(
                      child: StreamBuilder(
                          stream: docRef
                              .where('batchname',
                                  isEqualTo: dropdownvalue.toLowerCase())
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
                                return SubjectCard(
                                  subjectTitle: document['name'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => IndMarksScreen(
                                                batchname: dropdownvalue,
                                                name: document['name'])));
                                  },
                                );
                              }).toList(),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
