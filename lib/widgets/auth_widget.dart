import 'package:flutter/material.dart';
import 'package:flutter_examen_final/services/auth_service.dart';
import 'package:flutter_examen_final/widgets/login.dart';
import 'package:flutter_examen_final/widgets/tab_screen.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.hasData ? const TabScreen() : const Login();
        }

        return const MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}