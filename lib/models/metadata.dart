
import 'dart:convert';

class MetaFile {
  final String personalInfoPath;
  final String eventListPath;
  final String productListPath;

  MetaFile(
    this.personalInfoPath,
    this.eventListPath,
    this.productListPath,
  );


  Map<String, dynamic> toMap() {
    return {
      'personalInfoPath': personalInfoPath,
      'eventListPath': eventListPath,
      'productListPath': productListPath,
    };
  }

  factory MetaFile.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MetaFile(
      map['personalInfoPath'],
      map['eventListPath'],
      map['productListPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaFile.fromJson(String source) => MetaFile.fromMap(json.decode(source));
}
