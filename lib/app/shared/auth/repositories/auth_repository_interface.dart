import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User> getUser();

  Future getLoginEmailPassword();

  Future<User> getGoogleLogin();

  Future getLogout();
}
