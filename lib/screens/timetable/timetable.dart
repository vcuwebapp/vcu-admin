import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/submit_button.dart';

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen(
      {Key? key,
      required this.batch,
      required this.batchname,
      required this.std})
      : super(key: key);
  final String batch;
  final String std;
  final String batchname;

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  final docRef = FirebaseFirestore.instance.collection("timetable");

  final TextEditingController dateController = TextEditingController();
  final TextEditingController hourPhy = TextEditingController();
  final TextEditingController hourChe = TextEditingController();
  final TextEditingController hourMat = TextEditingController();
  final TextEditingController hourBio = TextEditingController();
  final TextEditingController hourExt = TextEditingController();
  final TextEditingController topicPhy = TextEditingController();
  final TextEditingController topicChe = TextEditingController();
  final TextEditingController topicMat = TextEditingController();
  final TextEditingController topicBio = TextEditingController();
  final TextEditingController topicExt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: "Timetable"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            child: TextField(
                                controller:
                                    dateController, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText: "Enter Date",
                                    labelStyle:
                                        kContentHeadingStyle //label text of field
                                    ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                    String formattedDate = DateFormat('dd-MM-y')
                                        .format(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Time',
                                    style: kContentHeadingStyle,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: hourPhy,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: kOrangeColor,
                                        hintText: 'Time',
                                        hintStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff9C9C9C),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: hourChe,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: kOrangeColor,
                                        hintText: 'Time',
                                        hintStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff9C9C9C),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: hourMat,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: kOrangeColor,
                                        hintText: 'Time',
                                        hintStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff9C9C9C),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: hourBio,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: kOrangeColor,
                                        hintText: 'Time',
                                        hintStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff9C9C9C),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: hourExt,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusColor: kOrangeColor,
                                        hintText: 'Time',
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
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Subject',
                                      style: kContentHeadingStyle,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 30,
                                      child: TextField(
                                        controller: topicPhy,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: kOrangeColor,
                                          hintText: 'Enter subject name',
                                          hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff9C9C9C),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 30,
                                      child: TextField(
                                        controller: topicChe,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: kOrangeColor,
                                          hintText: 'Enter subject name',
                                          hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff9C9C9C),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 30,
                                      child: TextField(
                                        controller: topicMat,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: kOrangeColor,
                                          hintText: 'Enter subject name',
                                          hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff9C9C9C),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 30,
                                      child: TextField(
                                        controller: topicBio,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: kOrangeColor,
                                          hintText: 'Enter subject name',
                                          hintStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff9C9C9C),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      height: 30,
                                      child: TextField(
                                        controller: topicExt,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusColor: kOrangeColor,
                                          hintText: 'Enter subject name ',
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomSubmitButton(ontapFunction: () {
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
                  try {
                    final ttData = <String, String>{
                      'date': dateController.text,
                      'subj1t': hourPhy.text,
                      'subj2t': hourChe.text,
                      'subj3t': hourMat.text,
                      'subj4t': hourBio.text,
                      'subj5t': hourExt.text,
                      'subj1': topicPhy.text,
                      'subj2': topicChe.text,
                      'subj3': topicMat.text,
                      'subj4': topicBio.text,
                      'subj5': topicExt.text,
                    };
                    docRef
                        .doc(widget.std.toLowerCase())
                        .collection(widget.batch.toLowerCase())
                        .doc(dateController.text)
                        .set(ttData)
                        .whenComplete(() {
                      setState(() {
                        dateController.text = '';
                        hourPhy.text = '';
                        hourChe.text = '';
                        hourMat.text = '';
                        hourBio.text = '';
                        hourExt.text = '';
                        topicPhy.text = '';
                        topicChe.text = '';
                        topicMat.text = '';
                        topicBio.text = '';
                        topicExt.text = '';

                        final snackBar = SnackBar(
                          content: Text('Timetable has been submitted!'),
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
                    }).onError((error, stackTrace) =>
                            print("Error writing document: $error"));
                  } on FirebaseException catch (e) {
                    print(e);
                    final snackBar = SnackBar(
                      content: Text(e.message!),
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
                  }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
