import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

class ClearedDoubtCard extends StatelessWidget {
  const ClearedDoubtCard({Key? key, required this.doubt, required this.stat})
      : super(key: key);

  final String doubt;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: kTypicalCardDecor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                doubt,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: (stat == 'false') ? Colors.red : Colors.green,
                ),
                height: 20,
                child: (stat == 'false')
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No',
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Yes'),
                      ))
          ],
        ),
      ),
    );
  }
}
