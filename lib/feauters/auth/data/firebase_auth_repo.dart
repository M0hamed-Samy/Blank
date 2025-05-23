import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/feauters/auth/doamin/entites/app_user.dart';
import 'package:myapp/feauters/auth/doamin/repo/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      //attemp to login
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(
            //
            email: email,
            password: password,
          );
      //create user
      AppUser user = AppUser(
        //
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );
      //return user
      return user;
    }
    //catch any errors
    catch (e) {
      throw Exception('login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      //attemp to sign up
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            //
            email: email,
            password: password,
          );
      //create user
      AppUser user = AppUser(
        //
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );
      //return user
      return user;
    }
    //catch any errors
    catch (e) {
      throw Exception('login failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    //get current logged in use from firebase
    final firebaseUser = firebaseAuth.currentUser;

    //no user logged in
    if (firebaseUser == null) {
      return null;
    }
    //user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!, name: '');
  }
}
