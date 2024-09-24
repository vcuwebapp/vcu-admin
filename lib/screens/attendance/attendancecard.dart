import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:vcuadmin/constants.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard(
      {Key? key, required this.changedState, required this.name})
      : super(key: key);

  final String name;
  final Function(bool value) changedState;

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                child: FlutterSwitch(
                    width: 50.0,
                    height: 30.0,
                    valueFontSize: 25.0,
                    toggleSize: 20.0,
                    borderRadius: 20.0,
                    padding: 5.0,
                    value: status,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                        widget.changedState(status);
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
