// import 'package:firebase_auth/firebase_auth.dart';

import '../authentication_service.dart';

class AuthRemote extends AuthenticationService {
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
}
