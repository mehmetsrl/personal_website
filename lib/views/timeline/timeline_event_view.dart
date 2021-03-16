import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/viewmodels/timeline/event_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class EventView extends StatelessWidget {
  final String id;
  const EventView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EventViewModel>.withConsumer(
      onModelReady: (model) => model.getEventData(id),
      builder: (context, model, child) => model.busy
          ? CircularProgressIndicator()
          : Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 320,
                    child: Image.network(
                      model.event.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    model.event.eventName,
                    style: getTextStyle(TextTypes.title),
                  ),
                ],
              ),
            ),
      viewModelBuilder: () {
        return EventViewModel(Provider.of<LayoutViewmodel>(context,listen: false).metafile.eventListPath);
      },
    );
  }
}
