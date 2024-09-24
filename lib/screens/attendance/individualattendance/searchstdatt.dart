import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/attendance/individualattendance/indattendance.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/subject_card.dart';

class SearchStdAtt extends StatefulWidget {
  const SearchStdAtt({Key? key}) : super(key: key);

  @override
  State<SearchStdAtt> createState() => _SearchStdAttState();
}

class _SearchStdAttState extends State<SearchStdAtt> {
  TextEditingController dateController = TextEditingController();
  TextEditingController feesController = TextEditingController();

  int fees = 0;
  final db = FirebaseFirestore.instance;

// List of items in our dropdown menu
  String dropdownvalue = 'XIRegular';
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
          screenname: 'Attendance',
        ),
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
                      child: SafeArea(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: StreamBuilder(
                                  stream: db
                                      .collection('students')
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
                                      children:
                                          snapshot.data!.docs.map((document) {
                                        print(document);
                                        return SubjectCard(
                                            subjectTitle: document['name'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          IndividualAttendance(
                                                              name: document[
                                                                  'name'],
                                                              std:
                                                                  document['std'],
                                                              batch: document[
                                                                  'batch'])));
                                            });
                                      }).toList(),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
          ),
        ),
            )));
  }
}
