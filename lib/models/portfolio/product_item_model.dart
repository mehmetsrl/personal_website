import 'dart:convert';

import 'package:personal_website/models/portfolio/product_display_model.dart';

enum ProductDisplayType {
  textDisplay,
  imageDisplay,
  codeDisplay,
  unityDisplay,
  arDisplay
}

class ProductItemModel {
  final String productId;
  final String title;
  final String bannerImageUrl;
  final List<String> keywords;
  final List<ProductDisplayModel> displays;

  ProductItemModel({
    this.productId,
    this.title,
    this.bannerImageUrl,
    this.keywords,
    this.displays,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'bannerImageUrl': bannerImageUrl,
      'keywords': keywords,
      'displays': displays?.map((x) => x?.toMap())?.toList(),
    };
  }


  factory ProductItemModel.fromMap(Map<String, dynamic> map,String productId) {
    if (map == null) return null;
  
    return ProductItemModel(
      productId: productId,
      title: map['title'],
      bannerImageUrl: map['bannerImageUrl'],
      keywords: List<String>.from(map['keywords']),
      displays: List<ProductDisplayModel>.from(map['displays']?.map((x) => ProductDisplayModel.fromMap(x))),
    );
  }
}
