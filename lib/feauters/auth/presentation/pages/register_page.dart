import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feauters/auth/presentation/components/my_button.dart';
import 'package:myapp/feauters/auth/presentation/cubits/auth_cubit.dart';

import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmController = TextEditingController();

  //register button
  void register() {
    //prepare info
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirm = confirmController.text;

    //auth cubit
    final authCubit = context.read<AuthCubit>();

    //ensure fields isnt empty
    if (email.isNotEmpty &&
        pw.isNotEmpty &&
        confirm.isNotEmpty &&
        name.isNotEmpty) {
      //ensure passwords are equal
      if (pw == confirm) {
        authCubit.register(name, email, pw);
      } //if passwords isnt equal
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password must be matched')),
        );
      }
    }
    //if empty -> display error
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all empty fields')),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmController.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                //Create account message
                Text(
                  //
                  "Lets create an account for you!",
                  style: TextStyle(
                    //
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                MyTextField(
                  controller: nameController,
                  hintText: "Name",
                  obscureText: false,
                ),

                SizedBox(height: 10),

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

                MyTextField(
                  controller: confirmController,
                  hintText: "Confrim Password",
                  obscureText: true,
                ),

                SizedBox(height: 15),
                //login button
                MyButton(
                  //
                  onTap: register,
                  text: "Register",
                ),
                const SizedBox(height: 20),

                //already member ? login!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member ?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Login now",
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
