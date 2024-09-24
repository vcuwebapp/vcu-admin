import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/fees/updatefees.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class SearchStudents extends StatefulWidget {
  const SearchStudents({Key? key}) : super(key: key);

  @override
  State<SearchStudents> createState() => _SearchStudentsState();
}

class _SearchStudentsState extends State<SearchStudents> {
  String dropdownvalue = 'XIRegular';
  int fees = 0;
  final docRef = FirebaseFirestore.instance.collection("students");

// List of items in our dropdown menu
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
        appBar: CtaAppbar(
          screenname: 'Fees',
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
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
                                    builder: (context) => UpdateFees(
                                        fees: document['feespaid'],
                                        uid: document['uid'],
                                        name: document['name'])));
                          },
                        );
                      }).toList(),
                    );
                  }),
            ],
          ),
        )));
  }
}
