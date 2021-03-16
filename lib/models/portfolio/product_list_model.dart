

import 'dart:convert';

import 'product_item_model.dart';

class ProductListModel {
  List<ProductItemModel> products;
  ProductListModel({
    this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'Products': products?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ProductListModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ProductListModel(
      products: List<ProductItemModel>.from(map['products']?.map((x) => ProductItemModel.fromMap(x,x['productId']))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductListModel.fromJson(String source) => ProductListModel.fromMap(json.decode(source));
}
