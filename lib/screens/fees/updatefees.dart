import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';
import 'package:vcuadmin/widgets/submit_button.dart';

class UpdateFees extends StatefulWidget {
  const UpdateFees(
      {Key? key, required this.name, required this.fees, required this.uid})
      : super(key: key);
  final String name;
  final String fees;
  final String uid;

  @override
  State<UpdateFees> createState() => _UpdateFeesState();
}

class _UpdateFeesState extends State<UpdateFees> {
  final updatefee = FirebaseFirestore.instance.collection('students');
  final TextEditingController feeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CtaAppbar(
          screenname: 'Fees',
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
                    'Total fees paid by ${widget.name} is ${widget.fees}. Update the fees paid by entering below',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kHeadingColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: feeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: kOrangeColor,
                        hintText: 'Enter fees paid',
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff9C9C9C),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomSubmitButton(
                    ontapFunction: () {
                      if (feeController.text.isEmpty) {
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
                        updatefee.doc(widget.uid).update(
                            {'feespaid': feeController.text}).whenComplete(() {
                          setState(() {
                            feeController.text = '';

                            final snackBar = SnackBar(
                              content: Text('Fees has been updated!'),
                              action: SnackBarAction(
                                label: 'Cancel',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
