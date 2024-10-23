import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:receipe_app/pages/login_page.dart';

import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (contest, snapshot) {
          print("New Changes: $snapshot");
          if (snapshot.hasData) {
            print("User Data: ${snapshot.data}");

            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
