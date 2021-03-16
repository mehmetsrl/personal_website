import 'dart:js';

import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/viewmodels/timeline/timeline_viewmodel.dart';
import 'package:personal_website/widgets/timeline/timeline_event_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TimelineViewModel>.withConsumer(
      onModelReady: (model) => model.getEvents(),
      builder: (context, model, child) => model.busy
          ? Center(child: CircularProgressIndicator())
          : TimelineEventList(events: model.events),
      viewModelBuilder: () {
        return TimelineViewModel(Provider.of<LayoutViewmodel>(context,listen: false).metafile.eventListPath);
      },
    );
  }
}
