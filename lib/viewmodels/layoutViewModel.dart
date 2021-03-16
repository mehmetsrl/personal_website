import 'dart:async';
import 'package:flutter/material.dart';
import 'package:personal_website/models/metadata.dart';
import 'package:personal_website/models/personalInfo.dart';
import 'package:personal_website/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../locator.dart';
import 'base_communication_model.dart';

class LayoutViewmodel extends BaseCommunicationModel {
  bool get isMobile => _sizingInformation?.isMobile;
  bool get isDesktop => _sizingInformation?.isDesktop;
  bool get isTablet => _sizingInformation?.isTablet;
  bool get isMobileOrTablet => _sizingInformation != null
      ? _sizingInformation.isMobile || _sizingInformation.isTablet
      : null;

  GlobalKey<ScaffoldState> _scaffoldKey;
  SizingInformation _sizingInformation;

  PersonalInfo _personalInfo;
  PersonalInfo get personalInfo => _personalInfo;

  String _profilePciturePath;
  String get profilePciturePath => _profilePciturePath;

  MetaFile _metafile;
  MetaFile get metafile => _metafile;

  LayoutViewmodel(
      {GlobalKey<ScaffoldState> scaffoldKey,
      SizingInformation sizingInformation}) {
    this._sizingInformation = sizingInformation;
    this._scaffoldKey = scaffoldKey;
  }
  updateScaffoldKey(GlobalKey<ScaffoldState> newKey) {
    _scaffoldKey = newKey;
  }

  updateSizingInfo(SizingInformation newSizingInformation) {
    _sizingInformation = newSizingInformation;
  }

  Future getInitialData() async {
    setBusy(true);
    _metafile = await storageService.getMetaFile();
    _personalInfo =
        await storageService.getPersonalInfo(_metafile.personalInfoPath);

    _profilePciturePath =
        storageService.getNetworkImagePath(_personalInfo.pictureImageUrl);
    setBusy(false);
  }

  Future getPersonalInfo() async {
    setBusy(true);
    if (_metafile != null && _metafile.personalInfoPath != null)
      _personalInfo =
          await storageService.getPersonalInfo(_metafile.personalInfoPath);
    // _metadata = await
    setBusy(false);
  }

  Future getMetadata() async {
    setBusy(true);
    _metafile = await storageService.getMetaFile();
    // _metadata = await
    setBusy(false);
  }

  NavigationService _navigationService = locator<NavigationService>();

  navigateTo(String navigationPath) {
    _navigationService.navigateTo(navigationPath);
  }

  navigateToProductsByKeywordId(
      String navigationPath, List<String> keywordIds) {
    _navigationService
        .navigateTo(navigationPath, query: {'keywords': keywordIds});
  }

  void onNavigationDrawerOpenButtonClicked() {
    _scaffoldKey?.currentState?.openDrawer();
  }

  void onNavigationDrawerButtonClicked() {
    _scaffoldKey?.currentState?.openEndDrawer();
  }
}
