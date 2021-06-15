import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:client_chaliar/business_logic/models/model_user.dart';

class AuthenticationService {
  // FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuthService auth = FirebaseAuthService();
  UserChaliar? _currentUser;
  UserChaliar? get currentUser => _currentUser;

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser;
    return user != null;
  }

  Future signUpWithEmail({
    required String email,
    required String password,
    String? name,
    String? surname,
    String? role,
  }) async {
    try {
      var authResult =
          await (auth.createUserWithEmailAndPassword(email, password) as Future<MyAppUser>);
      _currentUser = UserChaliar(
          id: authResult.uid,
          email: email,
          userRole: role,
          name: name,
          surname: surname);
      await _firestoreService.createUser(_currentUser!);
      return authResult != null;
    } catch (e) {
      return e.toString();
    }
  }
}
