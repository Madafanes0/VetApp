import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  try {
                    UserCredential userCredential = await _auth
                        .signInWithEmailAndPassword(
                            email: email, password: password);

                    // Check if the user is authenticated
                    if (userCredential.user != null) {
                      // Navigate to main menu upon successful login
                      Navigator.pushReplacementNamed(context, '/mainMenu');
                    } else {
                      // Display an error message if authentication fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Authentication failed.')),
                      );
                    }
                  } catch (e) {
                    // Display an error message for failed login
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed: ${e.toString()}'),
                      ),
                    );
                  }
                },
                child: Text('Log In'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}