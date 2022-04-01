import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  // create our auth user from the firebase user
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
