/*

Auth page -> this page control whether to show the login or register page 

*/

import 'package:flutter/material.dart';
import 'package:myapp/feauters/auth/presentation/pages/login_page.dart';
import 'package:myapp/feauters/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //intiallity , show login page
  bool showLoginPage = true;

  //toogle between pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(togglePages: togglePages);
    } else {
      return RegisterPage(togglePages: togglePages);
    }
  }
}
