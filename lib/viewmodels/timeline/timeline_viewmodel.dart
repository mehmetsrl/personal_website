import 'dart:js';

import 'package:personal_website/locator.dart';
import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/models/timeline/event_list_model.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/services/navigation_service.dart';
import 'package:personal_website/viewmodels/base_communication_model.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';

class TimelineViewModel extends BaseCommunicationModel {
  NavigationService _navigationService = locator<NavigationService>();

  List<EventItemModel> _events;
  List<EventItemModel> get events => _events;

  final String _eventsPath;

  TimelineViewModel(this._eventsPath);

  Future getEvents() async {
    setBusy(true);
    var eventResults = await storageService.getEventList(_eventsPath);

    if (eventResults is String) {
      // show error
    } else {
      (eventResults as EventListModel)
          .events
          .sort((e1, e2) => e2.time.compareTo(e1.time));

      _events = (eventResults as EventListModel).events;
    }
    setBusy(false);
  }

  navigateToEvent(String eventId) {
    _navigationService.navigateTo(EventRoute, query: {'id': eventId});
  }
}
