import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/portfolio/product_display_model.dart';
import 'package:personal_website/models/portfolio/product_item_model.dart';
import 'package:personal_website/models/text_model.dart';
import 'package:personal_website/models/timeline/event_item_model.dart';
import 'package:personal_website/widgets/web_buton/web_button.dart';

List<EventItemModel> testEvents = [
  EventItemModel(
    eventName: 'Academic Event',
    type: EventType.academic,
    details: 'I started school at somewhere',
    imageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    time: DateTime.parse('2020-01-07T12:09:40.477876'),
  ),
  EventItemModel(
    eventName: 'Occupational Event',
    type: EventType.occupational,
    details: 'I started job at somewhere',
    imageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    time: DateTime.parse('2020-02-07T12:09:40.477876'),
  ),
  EventItemModel(
    eventName: 'Award Event ',
    type: EventType.award,
    details: 'I won something',
    imageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    time: DateTime.parse('2020-03-07T12:09:40.477876'),
  ),
  EventItemModel(
    eventName: 'Certification Event',
    type: EventType.certification,
    details: 'I took this course from somewhere',
    imageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    time: DateTime.parse('2020-04-07T12:09:40.477876'),
  ),
  EventItemModel(
    eventName: 'Hobby Event',
    type: EventType.hobby,
    details: 'I start learn some sport activities',
    imageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    time: DateTime.parse('2020-05-07T12:09:40.477876'),
  ),
];

List<ProductItemModel> testProducts = [
  ProductItemModel(
    productId: "p1",
    title: 'Project 1',
    bannerImageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    displays: [
      ProductDisplayModel(
        displayType: ProductDisplayType.imageDisplay,
        content: {
          'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
          'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg'
        },
      ),
    ],
  ),
  ProductItemModel(
    productId: "p2",
    title: 'Project 2',
    bannerImageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    displays: [
      ProductDisplayModel(displayType: ProductDisplayType.codeDisplay, content: """
        EventItemModel(
          title: 'Academic Event',
          type: EventType.academic,
          details: 'I started school at somewhere',
          imageUrl:
              'someImage.jpg',
          time: DateTime.parse('2020-01-07T12:09:40.477876'),
          backgroundColor: Colors.lightGreen,
        ),
      """),
    ],
  ),
  ProductItemModel(
    productId: "p3",
    title: 'Project 3',
    bannerImageUrl:
        'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
    displays: [
      ProductDisplayModel(
          displayType: ProductDisplayType.unityDisplay,
          content: 'unitySourcePath'),
      //TODO
    ],
  ),
  ProductItemModel(
      productId: "p4",
      title: 'Project 4',
      bannerImageUrl:
          'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
      displays: [
        ProductDisplayModel(
            displayType: ProductDisplayType.arDisplay, content: ARTestPage)
      ]),
  ProductItemModel(
      productId: "p5",
      title: 'Project 5',
      bannerImageUrl:
          'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
      displays: [
        ProductDisplayModel(
          displayType: ProductDisplayType.textDisplay,
          content: TextModel(
            """
            This is text view.
            """,
            textStyle: getTextStyle(TextTypes.text),
          ),
        )
      ]),
  ProductItemModel(
      productId: "p6",
      title: 'Project 6 Mix',
      bannerImageUrl:
          'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
      displays: [
        ProductDisplayModel(
          displayType: ProductDisplayType.textDisplay,
          content: TextModel("""
        This is mixed view.
        """),
        ),
        ProductDisplayModel(
          displayType: ProductDisplayType.imageDisplay,
          content: {
            'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
            'https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg',
          },
        )
      ]),
];

class ARTestPage extends StatelessWidget {
  const ARTestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 500,
      child: Center(
        widthFactor: 150,
        heightFactor: 70,
        child: GestureDetector(
          child: WebButton('AR Test Button'),
          onTap: () => print("AR Button clicked!"),
        ),
      ),
    );
  }
}
