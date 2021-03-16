import 'package:flutter/material.dart';
import 'package:personal_website/models/portfolio/product_item_model.dart';
import 'package:personal_website/viewmodels/portfolio/portfolio_viewmodel.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductList extends StatelessWidget {
  final List<ProductItemModel> products;
  ProductList({this.products}) : 
  super();

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Container()
        : Wrap(
            spacing: 30,
            runSpacing: 30,
            children: <Widget>[
              ...products
                  .asMap()
                  .map(
                    (index, product) => MapEntry(
                      index,
                      GestureDetector(
                        child: ProductItem(model: product),
                        onTap: () => Provider.of<PortfolioViewModel>(context,
                                listen: false)
                            .navigateToProduct(product.productId),
                      ),
                    ),
                  )
                  .values
                  .toList()
            ],
          );
  }
}
