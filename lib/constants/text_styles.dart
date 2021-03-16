import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum TextTypes { cardTitle, cardText, code, title, text, emphasizedText }

// /// Returns the style for a page title based on the [deviceScreenType] passed in.
// TextStyle titleTextStyle(DeviceScreenType deviceScreenType) {
//   double titleSize = deviceScreenType == DeviceScreenType.mobile ? 50 : 80;
//   return TextStyle(
//       fontWeight: FontWeight.w800, height: 0.9, fontSize: titleSize);
// }

// /// Return the style for description text on a page based on the [deviceScreenType] passed in.
// TextStyle descriptionTextStyle(DeviceScreenType deviceScreenType) {
//   double descriptionSize =
//       deviceScreenType == DeviceScreenType.mobile ? 16 : 21;

//   return TextStyle(
//     fontSize: descriptionSize,
//     height: 1.7,
//   );
// }

double titleSize(DeviceScreenType deviceScreenType) {
  return deviceScreenType == DeviceScreenType.mobile ? 50 : 80;
}

double textSize(DeviceScreenType deviceScreenType) {
  return deviceScreenType == DeviceScreenType.mobile ? 16 : 21;
}

TextStyle getTextStyle(TextTypes type,
    {DeviceScreenType deviceScreenType, Color color}) {
  TextStyle style = deviceScreenType == null
      ? _textStylesMobile[type]
      : deviceScreenType == DeviceScreenType.mobile
          ? _textStylesMobile[type]
          : _textStylesDesktop[type];

  if (color != null) style.merge(TextStyle(color: color));
  return style;
}

//TODO: create all text styles
const Map<TextTypes, TextStyle> _textStylesMobile = const {
  TextTypes.title: const TextStyle(
      fontFamily: 'Arial',
      height: 0.9,
      fontSize: 50,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold),
  TextTypes.text: const TextStyle(
      fontFamily: 'Arial',
      height: 1.7,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal),
  TextTypes.cardTitle: const TextStyle(
      fontFamily: 'Arial',
      height: 0.9,
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold),
  TextTypes.cardText: const TextStyle(
      fontFamily: 'Arial',
      height: 1.5,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal),
  TextTypes.code: const TextStyle(
      fontFamily: 'Arial',
      height: 1.2,
      fontSize: 14,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      backgroundColor: Colors.blueAccent,
      wordSpacing: 0.8),
  TextTypes.emphasizedText: const TextStyle(
      fontFamily: 'Arial',
      height: 1.5,
      fontSize: 14,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      backgroundColor: Colors.orangeAccent,
      wordSpacing: 0.8),
};
const Map<TextTypes, TextStyle> _textStylesDesktop = const {
  TextTypes.title: const TextStyle(
      fontFamily: 'Arial',
      height: 0.9,
      fontSize: 80,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold),
  TextTypes.text: const TextStyle(
      fontFamily: 'Arial',
      height: 1.7,
      fontSize: 21,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal),
  TextTypes.cardTitle: const TextStyle(
      fontFamily: 'Arial',
      height: 0.9,
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold),
  TextTypes.cardText: const TextStyle(
      fontFamily: 'Arial',
      height: 1.5,
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal),
  TextTypes.code: const TextStyle(
      fontFamily: 'Arial',
      height: 1.2,
      fontSize: 18,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      backgroundColor: Colors.blueAccent,
      wordSpacing: 0.8),
  TextTypes.emphasizedText: const TextStyle(
      fontFamily: 'Arial',
      height: 1.5,
      fontSize: 18,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      backgroundColor: Colors.orangeAccent,
      wordSpacing: 0.8),
};
