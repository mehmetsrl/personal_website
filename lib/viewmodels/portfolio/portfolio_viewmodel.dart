import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:personal_website/locator.dart';
import 'package:personal_website/models/portfolio/product_item_model.dart';
import 'package:personal_website/models/portfolio/product_list_model.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/services/navigation_service.dart';
import 'package:personal_website/viewmodels/base_communication_model.dart';

class PortfolioViewModel extends BaseCommunicationModel {
  NavigationService _navigationService = locator<NavigationService>();

  final String productsFilePath;
  List<ProductItemModel> _products;

  List<String> _searchKeywords;

  PortfolioViewModel({
    @required this.productsFilePath,
    searchKeywords,
  }) {
    _searchKeywords = searchKeywords;
  }

  List<ProductItemModel> get products =>
      keywordQuery(_products, _searchKeywords);

  List<String> get searchKeywords => _searchKeywords;

  Future getProducts() async {
    setBusy(true);

    var productResults = await storageService.getProductList(productsFilePath);

    if (productResults is String) {
      // show error
    } else {
      _products = (productResults as ProductListModel).products;
    }

    setBusy(false);
  }

  updateSearchKeywords(List<String> searchKeywords) {
    _searchKeywords = searchKeywords;
    notifyListeners();
  }

  List<ProductItemModel> keywordQuery(
      List<ProductItemModel> productList, List<String> keywords) {
    print(keywords);
    if (keywords == null) return productList;
    if (keywords.length == 0) return productList;

    return productList
        .where((product) => keywords.every(
            (key) => product.keywords.any((productKey) => productKey == key)))
        .toList();
  }

  navigateToProduct(String productId) {
    _navigationService.navigateTo(ProductRoute, query: {'id': productId});
  }
}
