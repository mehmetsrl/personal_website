import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/constants/widgetTools.dart';
import 'package:personal_website/locator.dart';
import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/services/data_storage_service.dart';
import 'package:personal_website/widgets/image/image_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:universal_io/io.dart';

// ignore: must_be_immutable
class EventItemWidget extends StatelessWidget {
  final space = const SizedBox(
    height: 8.0,
    width: 8.0,
  );
  TextTheme textTheme;
  final EventItemModel model;
  EventItemWidget(
    this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.hardEdge,
        child: getCard(sizingInformation),
      ),
    );
  }

  Widget getCard(SizingInformation size) {
    switch (size.deviceScreenType) {
      case DeviceScreenType.mobile:
        return mobileEventItem();
        break;
      case DeviceScreenType.tablet:
        return tabletEventItem();
        break;
      case DeviceScreenType.desktop:
      default:
        return desktopEventItem();
        break;
    }
  }

  Widget desktopEventItem() {
    return Container(
      color: model.backgroundColor.withAlpha(90),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(model.imageUrl),
                space,
                Text(model.time.toString(), style: textTheme.caption),
              ],
            ),
          ),
          space,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                space,
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(model.eventName,
                        style: getTextStyle(TextTypes.cardTitle)),
                  ),
                ),
                space,
                Flexible(
                  child: Text(
                    model.details,
                    style: getTextStyle(TextTypes.cardText),
                  ),
                ),
              ],
            ),
          ),
          space
        ],
      ),
    );
  }

  Widget tabletEventItem() {
    return Container(
      color: model.backgroundColor.withAlpha(90),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  model.imageUrl,
                ),
                space,
                Text(model.time.toString(), style: textTheme.caption),
              ],
            ),
          ),
          space,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                space,
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(model.eventName,
                        style: getTextStyle(TextTypes.cardTitle)),
                  ),
                ),
                space,
                Flexible(
                  child: Text(
                    model.details,
                    style: getTextStyle(TextTypes.cardText),
                  ),
                ),
              ],
            ),
          ),
          space
        ],
      ),
    );
  }

  Widget mobileEventItem() {
    return Container(
        color: model.backgroundColor.withAlpha(90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              model.imageUrl,
            ),
            space,
            Text(model.time.toString(), style: textTheme.caption),
            bannerContentDevider,
            space,
            // Expanded(
            // child:
            Row(
              children: [
                space,
                Expanded(
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Container(
                      //     child:
                      Text(model.eventName,
                          style: getTextStyle(TextTypes.cardTitle)),
                      //   ),
                      // ),
                      space,
                      // Flexible(
                      //   child:
                      Text(
                        model.details,
                        style: getTextStyle(TextTypes.cardText),
                      ),
                      // ),
                    ],
                  ),
                ),
                space,
              ],
            ),
            space,

            // Expanded(
            //   child: Row(children: [
            //     space,
            //     Expanded(
            //       child: Column(
            //         children: [
            //           // Align(
            //           //   alignment: Alignment.topLeft,
            //           //   child: Container(
            //           //     child:
            //               Text(model.title, style: cardTitle),
            //           //   ),
            //           // ),
            //           space,
            //           // Flexible(
            //           //   child:
            //             Text(
            //               "This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text ",
            //               style: cardContent,
            //             ),
            //           // ),
            //         ],
            //       ),
            //     ),
            //     space,
            //   ]),
            // ),
          ],
        )

        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Image.network(
        //             model.imageUrl,
        //           ),
        //           space,
        //           Text(model.time.toString(), style: textTheme.caption),
        //         ],
        //       ),
        //     ),
        //     space,
        //     Expanded(
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           space,
        //           Align(
        //             alignment: Alignment.topLeft,
        //             child: Container(
        //               child: Text(model.title, style: cardTitle),
        //             ),
        //           ),
        //           space,
        //           Flexible(
        //             child: Text(
        //               "This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text This is a test text ",
        //               style: cardContent,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
