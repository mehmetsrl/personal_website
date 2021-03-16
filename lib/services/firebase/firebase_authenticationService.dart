// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../authentication_service.dart';

class AuthFirebase extends AuthenticationService {
  @override
  Future<AuthenticationResult> createUserWithEmailAndPassword({String email, String password}) {
      // TODO: implement createUserWithEmailAndPassword
      throw UnimplementedError();
    }
  
    @override
    Future<String> getUserId() {
      // TODO: implement getUserId
      throw UnimplementedError();
    }
  
    @override
    Future<AuthenticationResult> signInWithEmailAndPassword({String email, String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
  /*
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthenticationResult> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _getResult(authResult);
    } catch (e) {
      return _getExceptionResult(e);
    }
  }

  Future<AuthenticationResult> createUserWithEmailAndPassword(
      {String email, String password}) async {
    try {
      AuthResult authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _getResult(authResult);
    } catch (e) {
      return _getExceptionResult(e);
    }
  }

  Future<String> getUserId() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    if (user == null) return null;
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  AuthenticationResult _getExceptionResult(PlatformException e) {
    return AuthenticationResult(
        uId: null, resultType: _getAuthException(e), message: e.message);
  }

  AuthenticationResult _getResult(AuthResult result) {
    return (result.user.uid != null)
        ? AuthenticationResult(
            uId: result.user.uid,
            resultType: AuthResultType.successfullySignedIn,
            message: "Signed In!")
        : AuthenticationResult(
            uId: result.user.uid,
            resultType: AuthResultType.emptyUser,
            message: "General failure. Please try again later.");
  }

  AuthResultType _getAuthException(PlatformException e) {
    AuthResultType errorType;
    switch (e.code) {
      case 'ERROR_INVALID_EMAIL':
        errorType = AuthResultType.invalidMail;
        break;
      case 'ERROR_WEAK_PASSWORD':
        errorType = AuthResultType.weakPassword;
        break;
      case 'ERROR_USER_NOT_FOUND':
        errorType = AuthResultType.userNotFound;
        break;
      case 'ERROR_WRONG_PASSWORD':
        errorType = AuthResultType.wrongPassword;
        break;
      default:
        errorType = AuthResultType.networkError;
        break;
    }
    return errorType;
  }
  */
}
