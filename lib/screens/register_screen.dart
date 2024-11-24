import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Registration Form (Coming soon!)'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to login
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
