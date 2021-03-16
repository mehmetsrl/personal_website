import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_website/models/user.dart';

import 'firebase/firestore_dataService.dart';
import 'local/local_dataService.dart';
import 'remote/remote_dataService.dart';

enum DataServiceType {
  firestore,
  remote,
  local
}

class DataRequestResult {
  final String message;
  final DataRequestResultType resultType;

  DataRequestResult({@required this.resultType, @required this.message});
}

enum DataRequestResultType {
  successfullySignedIn,
  emptyUser,
  userNotFound,
  invalidMail,
  weakPassword,
  wrongPassword,
  networkError
}

abstract class DataStorageService {
  static DataServiceType authType;
  static DataStorageService storage;

  static DataStorageService generateDataService(type) {
    authType = type;
    switch (authType) {
      case DataServiceType.firestore:
        storage = FirestoreDataService();
        break;
      case DataServiceType.remote:
        storage = RemoteDataService();
        break;
      case DataServiceType.local:
        storage = LocalDataService();
        break;
      default:
      // auth = AuthFirebase();
    }
    return storage;
  }

  Future createUser(User user);
  Future getUser(String uid);    
  Future<dynamic> getProductList(String productsFilePath);
  Future<dynamic> getProduct(String productsFilePath, String id);
  Future<dynamic> getEventList(String eventsFilePath);
  Future<dynamic> getEvent(String eventsFilePath,String id);
  Future<dynamic> getPersonalInfo(String personalInfoPath,[bool relativePath = true]);
  Future<dynamic> getMetaFile([bool relativePath = true]);
  String getNetworkImagePath(String imagePath,[bool relativePath = true]);
}
