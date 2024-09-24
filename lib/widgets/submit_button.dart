import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({Key? key, required this.ontapFunction}) : super(key: key);

  final VoidCallback ontapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapFunction,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff404040),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 50,
        child: const Center(
          child: Text(
            'Submit',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
