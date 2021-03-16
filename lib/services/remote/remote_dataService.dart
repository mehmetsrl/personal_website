import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:personal_website/constants/test_data.dart';
import 'package:personal_website/models/metadata.dart';
import 'package:personal_website/models/personalInfo.dart';
import 'package:personal_website/models/portfolio/product_list_model.dart';
import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/models/timeline/event_list_model.dart';
import 'package:personal_website/models/user.dart';
import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:universal_io/io.dart';

import '../data_storage_service.dart';

class RemoteDataService extends DataStorageService {
  static const String _storageEndpoint =
      'http://127.0.0.1/resources/personalSite';
  // 'http://192.168.1.2/resources/personalSite';
  // 'https://mehmetsrl.com/resources/personalSite';
  // 'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics';
  // 'https://i.imgur.com/Ay7qnnR.jpg';

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
  Future<dynamic> getImagePath(String path, [bool relativePath = true]) async {
    print('imgPath ' + path);
    print('_storageEndpoint ' + _storageEndpoint);

    String requestPath = relativePath ? '$_storageEndpoint/$path' : path;

    print('requestPath ' + requestPath);
    var response = await http.get(requestPath);

    if (response.statusCode == 200) {
      var image = Image.network(json.decode(response.body));
      return image;
    }
    
  }

  @override
  Future<dynamic> getPersonalInfo(String personalInfoPath,
      [bool relativePath = true]) async {

    // print('personalInfoPath: '+'$_storageEndpoint/$personalInfoPath');
    var response = await http.get('$_storageEndpoint/$personalInfoPath');
    // print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var personalInfo =
          PersonalInfo.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return personalInfo;
    }

    // something wrong happened
    throw Exception('Could not fetch personal info. Make sure it exists.');
  }

  @override
  Future<dynamic> getMetaFile([bool relativePath = true]) async {
    // String requestPath=relativePath?'$_storageEndpoint/metafile.json':"metafile.json";

    // print('metafilePath: ' + '$_storageEndpoint/metafile.json');
    var response = await http.get('$_storageEndpoint/metafile.json');
    if (response.statusCode == 200) {
      // print(utf8.decode(response.bodyBytes));
      var metafile =
          MetaFile.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return metafile;
    }

    // something wrong happened
    throw Exception('Could not fetch personal info. Make sure it exists.');
  }

  @override
  Future<dynamic> getEventList(String eventsFilePath) async {
    var response = await http.get('$_storageEndpoint/$eventsFilePath');

    print('eventsFilePath: ' + '$_storageEndpoint/$eventsFilePath');
    if (response.statusCode == 200) {
      var eventList =
          EventListModel.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return eventList;
    }

    // return testEvents;

    // something wrong happened
    throw Exception('Could not fetch personal info. Make sure it exists.');
  }

  @override
  Future<dynamic> getProductList(String productsFilePath) async {
        var response = await http.get('$_storageEndpoint/$productsFilePath');

    print('productsFilePath: ' + '$_storageEndpoint/$productsFilePath');
    if (response.statusCode == 200) {
      var productList =
          ProductListModel.fromMap(json.decode(utf8.decode(response.bodyBytes)));
      return productList;
    }

    // return testProducts;

    // something wrong happened
    throw Exception('Could not fetch personal info. Make sure it exists.');
  }

  @override
  Future<dynamic> getEvent(String eventsFilePath, String id) async {

    EventListModel eventList= await getEventList(eventsFilePath);
    return eventList.events.singleWhere((event) => event.eventId==id);
        // .elementAt(id);

    // return testEvents.elementAt(id);
  }

  @override
  Future<dynamic> getProduct(String productsFilePath,String id) async {
    
    ProductListModel productList= await getProductList(productsFilePath);
    return productList.products.singleWhere((product) => product.productId==id);
        // .elementAt(id);

    // return testProducts.elementAt(id);
  }

  @override
  getNetworkImagePath(String imagePath, [bool relativePath = true]) {
    return imagePath;
  }
}

Future<String> readResponse(HttpClientResponse response) {
  final completer = Completer<String>();
  final contents = StringBuffer();
  response.transform(utf8.decoder).listen((data) {
    contents.write(data);
  }, onDone: () => completer.complete(contents.toString()));
  return completer.future;
}
