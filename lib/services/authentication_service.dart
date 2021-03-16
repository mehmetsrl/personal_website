import 'package:flutter/foundation.dart';
import 'package:personal_website/models/user.dart';
import 'package:personal_website/services/local/local_authenticationService.dart';
import 'package:personal_website/services/remote/remote_authenticationService.dart';

import '../locator.dart';
import 'data_storage_service.dart';
import 'firebase/firebase_authenticationService.dart';

enum AuthType {
  firebase,
  remote,
  local
}

class AuthenticationResult {
  final String uId;
  final String message;
  final AuthResultType resultType;

  AuthenticationResult(
      {@required this.uId, @required this.resultType, @required this.message});
}

enum AuthResultType {
  successfullySignedIn,
  emptyUser,
  userNotFound,
  invalidMail,
  weakPassword,
  wrongPassword,
  networkError
}

abstract class AuthenticationService {
  static AuthType authType;
  static AuthenticationService auth;
  final DataStorageService _dataService = locator<DataStorageService>();

  static AuthenticationService generateAuth(type) {
    authType = type;
    switch (authType) {
      case AuthType.firebase:
        auth = AuthFirebase();
        break;
      case AuthType.remote:
        auth = AuthRemote();
        break;
      case AuthType.local:
        auth = AuthLocal();
        break;
      default:
        auth = AuthFirebase();
    }
    return auth;
  }

  User _currentUser;
  User get currentUser => _currentUser;

  Future<AuthenticationResult> signInWithEmail({
    @required String email,
    @required String password,
  }) async {
    AuthenticationResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    await _populateUser(result.uId);
    return result;
  }

  Future<AuthenticationResult> signUpWithEmail({
    @required String email,
    @required String password,
    @required String name,
    @required String surName,
    @required String role,
  }) async {
    AuthenticationResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    _currentUser = User(
      id: result.uId,
      email: email,
      name: name,
      surName: surName,
      userRole: role,
    );

    await _dataService.createUser(_currentUser);
    return result;
  }

  Future<bool> isUserLoggedIn() async {
    String userId=await auth.getUserId();
    if (userId != null) {
      await _populateUser(userId);
      return true;
    }
    return false;
  }

  Future<AuthenticationResult> signInWithEmailAndPassword(
      {String email, String password});
  Future<AuthenticationResult> createUserWithEmailAndPassword(
      {String email, String password});
  Future<String> getUserId();
  Future<void> signOut();
  Future _populateUser(String userId) async {
    if (userId != null)
      _currentUser = await _dataService.getUser(userId);
  }
}
