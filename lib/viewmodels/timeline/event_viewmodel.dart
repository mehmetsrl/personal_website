import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/viewmodels/base_communication_model.dart';

class EventViewModel extends BaseCommunicationModel {  
  EventItemModel _event;
  EventItemModel get event => _event;

  final String _eventsFilePath;
  EventViewModel(this._eventsFilePath);

  Future getEventData(String id) async {
    setBusy(true);

    var response = await storageService.getEvent(_eventsFilePath, id);

    if (response is String) {
      _event = EventItemModel(eventName: response);
    } else {
      _event = response;
    }
    setBusy(false);
  }
}
