import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/viewmodels/portfolio/product_viewmodel.dart';
import 'package:personal_website/widgets/image/image_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ProductView extends StatelessWidget {
  final String id;
  const ProductView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductViewModel>.withConsumer(
      onModelReady: (model) => model.getProduct(id),
      builder: (context, model, child) => model.busy
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 320,
                    child: ImageWidget(model.product.bannerImageUrl),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    model.product.title,
                    style: getTextStyle(TextTypes.title),
                  ),
                ],
              ),
            ),
      viewModelBuilder: () {
        return ProductViewModel(
            Provider.of<LayoutViewmodel>(context, listen: false)
                .metafile
                .productListPath);
      },
    );
  }
}
