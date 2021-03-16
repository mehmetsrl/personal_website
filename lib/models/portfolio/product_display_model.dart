import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

import 'product_item_model.dart';

class ProductDisplayModel {
  final ProductDisplayType displayType;
  final dynamic content;

  ProductDisplayModel({
    this.displayType,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayType': EnumToString.convertToString(displayType),
      'display': content,
    };
  }

  factory ProductDisplayModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductDisplayModel(
      displayType: EnumToString.fromString(
          ProductDisplayType.values, (map['displayType'])),
      content: map['display'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDisplayModel.fromJson(String source) =>
      ProductDisplayModel.fromMap(json.decode(source));
}
