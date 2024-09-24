import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/screens/doubts/dcard.dart';
import 'package:vcuadmin/screens/doubts/doubtslist.dart';
import 'package:vcuadmin/widgets/cta_appbar.dart';

class StdList extends StatefulWidget {
  const StdList({Key? key}) : super(key: key);

  @override
  State<StdList> createState() => _StdListState();
}

class _StdListState extends State<StdList> {
  final docRef = FirebaseFirestore.instance.collection("students");
  String dropdownvalue = 'xiregular';
  var items = [
    'xiregular',
    'xiengineering',
    'ximedical',
    'xiiregular',
    'xiiengineering',
    'xiimedical',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CtaAppbar(screenname: 'Doubts'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
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
                StreamBuilder(
                    stream: docRef
                        .where('batchname', isEqualTo: dropdownvalue)
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
                          return DCard(
                            name: document['name'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatDoubt(
                                            name: document['name'],
                                          )));
                            },
                          );
                        }).toList(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
