import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/marks/markscard.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/submit_button.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({Key? key, required this.batchname}) : super(key: key);
  final String batchname;

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final docRef = FirebaseFirestore.instance.collection("students");
  final marksRef = FirebaseFirestore.instance.collection('marks');

  Map<String, dynamic> markdata = {};

  String dropdownvalue = 'Physics';
  var items = [
    'Physics',
    'Chemistry',
    'Mathematics',
    'Biology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Marks'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Marks',
                          style: kContentHeadingStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 60,
                          height: 30,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: marksController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: kOrangeColor,
                              hintText: 'Marks',
                              hintStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff9C9C9C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Subject',
                          style: kContentHeadingStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                      ],
                    )
                  ],
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
                          markdata[document['name']] = '';
                          return MarksCard(
                              name: document['name'],
                              changedState: (val) {
                                print('inside changedstate');
                                markdata[document['name'].toString()] = val;
                              });
                        }).toList(),
                      );
                    }),
                CustomSubmitButton(ontapFunction: () {
                  markdata['date'] = dateController.text;
                  markdata['subject'] = dropdownvalue;
                  markdata['totalmarks'] = marksController.text;
                  marksRef
                      .doc(widget.batchname)
                      .collection(dropdownvalue.toLowerCase())
                      .doc(dateController.text)
                      .set(markdata)
                      .whenComplete(() {
                    setState(() {
                      dateController.text = '';
                      marksController.text = '';

                      final snackBar = SnackBar(
                        content: Text('Marks have been uploaded!'),
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
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
