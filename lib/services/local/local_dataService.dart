import 'dart:convert';

import 'package:flutter/services.dart';
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

class LocalDataService extends DataStorageService {
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
  Future<dynamic> getImage(String path, [bool relativePath = true]) async {
    NetworkImage img = await NetworkImage("assets/content/$path");

    return img;
  }

  @override
  Future<dynamic> getPersonalInfo(String personalInfoPath,
      [bool relativePath = true]) async {
    String personalInfoSource =
        await rootBundle.loadString('content/$personalInfoPath');

    var personalInfo = PersonalInfo.fromMap(json.decode(personalInfoSource));
    return personalInfo;
  }

  @override
  Future<dynamic> getMetaFile([bool relativePath = true]) async {
    String metaFileSource =
        await rootBundle.loadString('content/metafile.json');

    var metaFile = MetaFile.fromMap(json.decode(metaFileSource));

    return metaFile;
  }

  @override
  Future<dynamic> getEventList(String eventsFilePath) async {
    String eventListSource =
        await rootBundle.loadString('content/$eventsFilePath');

    var eventList = EventListModel.fromMap(json.decode(eventListSource));
    return eventList;
  }

  @override
  Future<dynamic> getProductList(String productsFilePath) async {
    String productsFileSource =
        await rootBundle.loadString('content/$productsFilePath');

    var productList = ProductListModel.fromMap(json.decode(productsFileSource));
    return productList;
  }

  @override
  Future<dynamic> getEvent(String eventsFilePath, String id) async {
    EventListModel eventList = await getEventList(eventsFilePath);
    return eventList.events.singleWhere((event) => event.eventId == id);
  }

  @override
  Future<dynamic> getProduct(String productsFilePath, String id) async {
    ProductListModel productList = await getProductList(productsFilePath);
    return productList.products
        .singleWhere((product) => product.productId == id);
  }

  @override
  getNetworkImagePath(String imagePath, [bool relativePath = true]) {
    return "assets/content/$imagePath";
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
