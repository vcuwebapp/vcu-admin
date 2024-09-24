import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/attendance/attendancecard.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/submit_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key, required this.batchname}) : super(key: key);

  final String batchname;

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final docRef = FirebaseFirestore.instance.collection("students");
  final attRef = FirebaseFirestore.instance.collection("attendance");
  List documents = [];
  var std = '';
  var batch = '';
  Map<String, dynamic> attdata = {};
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Attendance'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // FutureBuilder(
              //     future: getMarker(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         return Column(
              //           children: [
              //             for (var i in documents)
              //               AttendanceCard(
              //                   name: i.toString(),
              //                   changedState: (val) {
              //                     attdata[i.toString()] = val;
              //                   }),
              //             Padding(
              //               padding: const EdgeInsets.all(20.0),
              //               child: CustomSubmitButton(ontapFunction: () {
              //                 print(attdata);
              //               }),
              //             )
              //           ],
              //         );
              //       } else {
              //         return Center(child: const CircularProgressIndicator());
              //       }
              //     }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: TextField(
                      controller:
                          dateController, //editing controller of this TextField
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date",
                          labelStyle: kContentHeadingStyle //label text of field
                          ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-y').format(
                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(
                              formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            dateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
                ),
              ),
              StreamBuilder(
                  stream: docRef
                      .where('batchname', isEqualTo: widget.batchname)
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
                        std = document['std'];
                        batch = document['batch'];
                        attdata[document['name']] = true;
                        return AttendanceCard(
                            name: document['name'],
                            changedState: (val) {
                              print('insidechanged');
                              attdata[document['name'].toString()] = val;
                            });
                      }).toList(),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomSubmitButton(ontapFunction: () {
                  attdata['date'] = dateController.text;
                  attRef
                      .doc(std)
                      .collection(batch)
                      .doc(dateController.text)
                      .set(attdata)
                      .whenComplete(() {
                    setState(() {
                      final snackBar = SnackBar(
                        content: Text('Attendance has been reported!'),
                        action: SnackBarAction(
                          label: 'Cancel',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
