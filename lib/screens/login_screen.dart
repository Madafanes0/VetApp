import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/mainMenu'); // Navigate to main menu
              },
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/register'); // Navigate to registration screen
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
