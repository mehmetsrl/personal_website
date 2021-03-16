import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/portfolio/product_item_model.dart';
import 'package:personal_website/widgets/image/image_widget.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel model;
  const ProductItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black,
              height: 180,
              child: Center(
                child: Container(
                  color: Colors.grey[200],
                  child: ImageWidget(model.bannerImageUrl)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    style: getTextStyle(TextTypes.title),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ); //.showCursorOnHover;
  }
}
