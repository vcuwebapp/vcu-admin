import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/reports/viewstudents.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/submit_button.dart';

class ViewReport extends StatefulWidget {
  const ViewReport({Key? key}) : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  TextEditingController dateController = TextEditingController();

  String std = 'xi';
  String dropdownvalue = 'Regular';
  int fees = 0;
  final db = FirebaseFirestore.instance;

// List of items in our dropdown menu
  var items = [
    'Regular',
    'Engineering',
    'Medical',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CtaAppbar(
          screenname: 'View Report',
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: kTypicalCardDecor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'Enter Details',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kHeadingColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: TextField(
                          controller:
                              dateController, //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Enter Date",
                              labelStyle:
                                  kContentHeadingStyle //label text of field
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
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          title: Text(
                            "XI",
                            style: kContentHeadingStyle,
                          ),
                          value: "xi",
                          groupValue: std,
                          onChanged: (value) {
                            setState(() {
                              std = value.toString();
                              print(std);
                            });
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          title: Text(
                            "XII",
                            style: kContentHeadingStyle,
                          ),
                          value: "xii",
                          groupValue: std,
                          onChanged: (value) {
                            setState(() {
                              std = value.toString();
                              print(std);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
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
                  CustomSubmitButton(
                    ontapFunction: () {
                      if (dateController.text.isEmpty) {
                        final snackBar = SnackBar(
                          content: Text('Please enter date'),
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
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportStudentsList(
                                      batch: dropdownvalue.toLowerCase(),
                                      std: std.toLowerCase(),
                                      date: dateController.text,
                                    )));
                      }
                      // FirebaseAuth.instance.currentUser
                      //     ?.updateDisplayName(nameController.text);
                      //
                      // final userdata = <String, String>{
                      //   'uid': uid!,
                      //   'name': nameController.text,
                      //   'std': std.toLowerCase(),
                      //   'batch': dropdownvalue.toLowerCase(),
                      //   'feespaid': feesController.text,
                      //   'batchname': '${std}${dropdownvalue}'
                      // };
                      //
                      // db.collection('students').doc(uid).set(userdata).onError(
                      //     (error, stackTrace) =>
                      //         print("Error writing document: $error"));
                      //
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
