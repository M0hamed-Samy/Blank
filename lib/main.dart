import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/feauters/auth/presentation/pages/auth_page.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/themes/light_mode.dart';

void main() async {
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home: const AuthPage(),
    );
  }
}
