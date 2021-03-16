import 'package:flutter/material.dart';
import 'package:personal_website/services/data_storage_service.dart';

import '../../locator.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  const ImageWidget(this.imagePath, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      locator<DataStorageService>().getNetworkImagePath(imagePath),
      errorBuilder: (context, object, stackTrace) =>
          Image.asset("assets/images/img_placeholder.png"),
      fit: BoxFit.cover,
    );
  }
}
