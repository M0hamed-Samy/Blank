// Auth cubit state management

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/feauters/auth/doamin/entites/app_user.dart';
import 'package:myapp/feauters/auth/doamin/repo/auth_repo.dart';
import 'package:myapp/feauters/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check if user already authenticated

  //get current user

  //login with email
}
