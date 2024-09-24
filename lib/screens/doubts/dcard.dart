import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class DCard extends StatefulWidget {
  const DCard({Key? key, required this.name, required this.onTap})
      : super(key: key);

  final String name;
  final VoidCallback onTap;

  @override
  State<DCard> createState() => _DCardState();
}

class _DCardState extends State<DCard> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
        onTap: widget.onTap,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
