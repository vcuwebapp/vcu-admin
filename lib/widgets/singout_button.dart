import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomSignOutButton extends StatelessWidget {
  const CustomSignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff404040),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 50,
        child: const Center(
          child: Text(
            'Sign out',
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
