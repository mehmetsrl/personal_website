

import 'dart:convert';

import 'package:personal_website/models/timeline/event_item_model.dart';

class EventListModel {
  List<EventItemModel> events;
  EventListModel({
    this.events,
  });

  Map<String, dynamic> toMap() {
    return {
      'events': events?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory EventListModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return EventListModel(
      events: List<EventItemModel>.from(map['events']?.map((x) => EventItemModel.fromMap(x,x['eventId']))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventListModel.fromJson(String source) => EventListModel.fromMap(json.decode(source));
}
