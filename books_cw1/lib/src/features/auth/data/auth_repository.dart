import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/app_user.dart';

class AuthRepository {
  AuthRepository(this.auth);

  FirebaseAuth auth;

  Stream<AppUser?> authStateChanges() {
    return auth.authStateChanges()
      .map((user) => user == null ? null : AppUser(user.uid, user.email));
  }
  
  AppUser? get currentUser {
    User? user = auth.currentUser;
    return user == null ? null : AppUser(user.uid, user.email);
  }
  
  Future<String> getAuthToken() async { // won't be called when unsigned in. 
    String? token = await auth.currentUser?.getIdToken();
    return token ?? "";
  }

  Future<void> singInWithEmailAndPassword(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> registerWithEmailAndPassword(String email, String password) {
    return auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> singOut() {
    return auth.signOut();
  }
}

final authRepostitoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance);
});