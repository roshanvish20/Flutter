import 'package:flutter/material.dart';

class LoginWithUsername extends StatelessWidget {
  final String phoneNumber;
  final String name;

  const LoginWithUsername({
    super.key,
    required this.phoneNumber,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login With Username')),
      body: Center(
        child: Text('Phone: $phoneNumber\nName: $name'),
      ),
    );
  }
}
