/*
 
  excisting user can login with their : 
    -email
    -pw

----------------------------------------

  successfully login in ==Redirect==> HomePage

  if user doesnt have account yet they can go to sign up page from login
  
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feauters/auth/presentation/components/my_button.dart';
import 'package:myapp/feauters/auth/presentation/components/my_text_field.dart';
import 'package:myapp/feauters/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  //login button pressed
  void login() {
    //prepare email and pw
    final String email = emailController.text;
    final String pw = pwController.text;

    //auth cubit
    final authCubit = context.read<AuthCubit>();

    //email and pw isnt empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      //login !
      authCubit.login(email, pw);
    }
    //errors if empty fields
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid email and password")),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();

    super.dispose();
  }

  //Build UI
  @override
  Widget build(BuildContext context) {
    //scaffold
    return Scaffold(
      //
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Icon(
                  Icons.lock_open_rounded, //
                  size: 80, //
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                //welcoming message
                Text(
                  //
                  "Welcome Back !",
                  style: TextStyle(
                    //
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: pwController,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 15),
                //login button
                MyButton(
                  //
                  onTap: login,
                  text: "Login",
                ),
                const SizedBox(height: 20),

                //not a member ? register!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member ?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Register now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
