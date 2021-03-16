import 'package:personal_website/models/portfolio/product_item_model.dart';
import 'package:personal_website/viewmodels/base_communication_model.dart';

class ProductViewModel extends BaseCommunicationModel {
  ProductItemModel _prouct;
  ProductItemModel get product => _prouct;

  final String _productsFilePath;
  ProductViewModel(
    this._productsFilePath,
  );

  Future getProduct(String id) async {
    setBusy(true);

    var response = await storageService.getProduct(_productsFilePath, id);

    if (response is String) {
      _prouct = ProductItemModel(title: response);
    } else {
      _prouct = response;
    }
    setBusy(false);
  }
}
