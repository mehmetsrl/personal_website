import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/personalInfo.dart';

class PersonalLanguagesWidget extends StatelessWidget {
  final PersonalInfo personalInfo;
  const PersonalLanguagesWidget(this.personalInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lime,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Languages",
            style: getTextStyle(TextTypes.cardTitle),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.lime[900],
              border: Border.all(width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...personalInfo.languages
                    .asMap()
                    .map(
                      (index, language) => MapEntry(
                        index,
                        Column(
                          children: [
                            SizedBox(
                              height: index > 0 ? 10 : 0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    language.languageName,
                                    style: getTextStyle(TextTypes.text)
                                        .merge(TextStyle(color: Colors.lime)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 20,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) => Stack(
                                        children: [
                                          Opacity(
                                            opacity: (index >
                                                        language.overallLevel -
                                                            1) &&
                                                    (language.overallLevel > 0)
                                                ? 0.2
                                                : 1,
                                            child: Icon(
                                              Icons.star,
                                              color: (index >
                                                          language.overallLevel -
                                                              1) &&
                                                      (language.overallLevel >
                                                          0)
                                                  ? Colors.lime
                                                  : Colors.lime,
                                              size: 24.0,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: Colors.lime,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
