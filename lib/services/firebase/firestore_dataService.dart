import 'dart:async';

import 'package:personal_website/models/user.dart';

import '../data_storage_service.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataService extends DataStorageService {
  @override
  Future createUser(User user) {
      // TODO: implement createUser
      throw UnimplementedError();
    }
  
    @override
    Future getUser(String uid) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  
  @override
  Future<dynamic> getPersonalInfo(String personalInfoPath,[bool relativePath = true]) {
    // TODO: implement getPersonalInfo
    throw UnimplementedError();
  }

  @override
  Future getEventList(String eventsFilePath) {
    // TODO: implement getEvents
    throw UnimplementedError();
  }

  @override
  Future getProductList(String productsFilePath) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future getEvent(String eventsFilePath,String id) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

  @override
  Future getProduct(String productsFilePath, String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future getMetaFile([bool relativePath = true]) {
    // TODO: implement getMetadata
    throw UnimplementedError();
  }

  @override
  Future getImage(String imagePath, [bool relativePath = true]) {
    // TODO: implement getImage
    throw UnimplementedError();
  }

  @override
  String getNetworkImagePath(String imagePath, [bool relativePath = true]) {
    // TODO: implement getNetworkImagePath
    throw UnimplementedError();
  }
  /*
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

  @override
  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  @override
  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }*/
}
