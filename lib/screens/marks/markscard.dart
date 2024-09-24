import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class MarksCard extends StatefulWidget {
  const MarksCard({Key? key, required this.name, required this.changedState})
      : super(key: key);

  final String name;
  final Function(String value) changedState;

  @override
  State<MarksCard> createState() => _MarksCardState();
}

class _MarksCardState extends State<MarksCard> {
  final TextEditingController marksController = TextEditingController();

  var x;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: kTypicalCardDecor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: kHeadingStyle,
              ),
              Container(
                width: 60,
                height: 30,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: marksController,
                  onChanged: (str) {
                    widget.changedState(str);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    focusColor: kOrangeColor,
                    hintText: 'Marks',
                    hintStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
