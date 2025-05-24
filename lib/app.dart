import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feauters/auth/data/firebase_auth_repo.dart';
import 'package:myapp/feauters/auth/presentation/cubits/auth_cubit.dart';
import 'package:myapp/feauters/auth/presentation/cubits/auth_states.dart';
import 'package:myapp/feauters/auth/presentation/pages/auth_page.dart';
import 'package:myapp/feauters/post/presentation/pages/home_page.dart';
import 'package:myapp/themes/light_mode.dart';
/*

root level of our app
---------------------------------------------------

Repositres for the the database 
  -firebase

Bloc providers : for state management
  -auth
  -profile
  -post
  -search
  -theme

Check Auth State
 -unauthenticated -> auth page (login/register)
 -authenteciated  -> home page 




*/

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //provoiding cubit to owr app
    return BlocProvider(
      //
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        //
        debugShowCheckedModeBanner: false,
        theme: lightmode,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, authState) {
            print(authState);

            // -unauthenticated -> auth page (login/register)
            if (authState is Unauthenticated) {
              return const AuthPage();
            }
            //-authenteciated  -> home page
            if (authState is Authenticated) {
              return const HomePage();
            }
            //loading...
            else {
              return const Scaffold(
                //
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthErrors) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          //listener: listener,
        ),
      ),
    );
  }
}
