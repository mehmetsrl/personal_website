import 'package:flutter/material.dart';
import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/viewmodels/timeline/timeline_viewmodel.dart';
import 'package:personal_website/widgets/timeline/timeline_end_widget.dart';
import 'package:personal_website/widgets/timeline/timeline_start_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'event_item_widget.dart';

class TimelineEventList extends StatelessWidget {
  final List<EventItemModel> events;
  final TimelinePosition position;

  TimelineEventList({this.events, this.position});

  timelineModel(TimelinePosition position) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: position == TimelinePosition.Left?Alignment.centerLeft:Alignment.center,
            child: TimelineEndWidget()),
          SizedBox(height: 5,),
          Expanded(
            child: Timeline.builder(
              shrinkWrap: false,
                itemBuilder: centerTimelineBuilder,
                itemCount: events.length,
                physics: position == TimelinePosition.Left
                    ? BouncingScrollPhysics()
                    : ClampingScrollPhysics(),
                position: position),
          ),
          // TimelineStartWidget(),
        ],
      );

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final event = events[i];
    return TimelineModel(
        GestureDetector(
          child: EventItemWidget(event),
          onTap: () => Provider.of<TimelineViewModel>(context, listen: false)
              .navigateToEvent(event.eventId),
        ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == events.length,
        iconBackground: event.backgroundColor,
        icon: Icon(event.getIcon()));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => timelineModel(position != null
          ? position
          : sizingInformation.isDesktop
              ? TimelinePosition.Center
              : TimelinePosition.Left),
    );
  }
}
