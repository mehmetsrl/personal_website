import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/personalInfo.dart';

class PersonalCompetenciesWidget extends StatelessWidget {
  final PersonalInfo personalInfo;
  const PersonalCompetenciesWidget(this.personalInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
            "Competencies",
            style: getTextStyle(TextTypes.cardTitle),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.lime[900],
              border: Border.all(width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...personalInfo.competencies
                    .asMap()
                    .map(
                      (index, competency) => MapEntry(
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
                                    competency.competencyName,
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
                                            opacity: index >
                                                    competency.competencyLevel -
                                                        1
                                                ? 0.2
                                                : 1,
                                            child: Icon(
                                              Icons.star,
                                              color: index >
                                                      competency
                                                              .competencyLevel -
                                                          1
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
