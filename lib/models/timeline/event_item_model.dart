import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum EventType {
  academic,
  occupational,
  award,
  certification,
  hobby,
}

class EventItemModel {
  final String eventId;
  final String eventName;
  final EventType type;
  final String details;
  final DateTime time;
  final String imageUrl;
  final String linkedProductId;

  EventItemModel({
    this.eventId,
    this.eventName,
    this.type,
    this.details,
    this.time,
    this.imageUrl,
    this.linkedProductId,
  });

    Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'eventId': eventId,
      'type': EnumToString.convertToString(type),
      'details': details,
      'time': time?.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
      'linkedProductId': linkedProductId,
    };
  }


  EventItemModel.fromMap(Map<String, dynamic> map,String eventId)
      : eventId = eventId,
        eventName = map['eventName'],
        type = EnumToString.fromString(EventType.values, map['type']),
        details = map['details'],
        time = DateTime.parse(map['time']),
        imageUrl = map['imageUrl'],
        linkedProductId = map['linkedProductId']
  ;

  Color get backgroundColor {
    switch (type) {
      case EventType.academic:
        return Colors.redAccent;
        break;
      case EventType.occupational:
        return Colors.blueAccent;
        break;
      case EventType.award:
        return Colors.yellowAccent;
        break;
      case EventType.certification:
        return Colors.orangeAccent;
        break;
      case EventType.hobby:
        return Colors.greenAccent;
        break;
      default:
        return Colors.grey[400];
    }
  }

  IconData getIcon() {
    switch (type) {
      case EventType.academic:
        return Icons.school;
        break;
      case EventType.occupational:
        return Icons.engineering;
        break;
      case EventType.award:
        return Icons.emoji_events;
        break;
      case EventType.certification:
        return Icons.receipt_long;
        break;
      case EventType.hobby:
        return Icons.sports_tennis;
        break;
      default:
        return Icons.event;
    }
  }
}
