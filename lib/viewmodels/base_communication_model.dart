import 'package:flutter/widgets.dart';
import 'package:personal_website/services/data_storage_service.dart';

import '../locator.dart';

class BaseCommunicationModel extends ChangeNotifier {
  final DataStorageService storageService =
      locator<DataStorageService>();

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
