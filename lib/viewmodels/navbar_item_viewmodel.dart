import 'package:flutter/material.dart';
import 'package:personal_website/locator.dart';
import 'package:personal_website/models/navbar_item_model.dart';
import 'package:personal_website/services/navigation_service.dart';

class NavBarItemViewModel extends ChangeNotifier {
  final NavBarItemModel model;
  NavBarItemViewModel(this.model);

  onClicked(){
    print(model.navigationPath);
    locator<NavigationService>().navigateTo(model.navigationPath);
  }

}