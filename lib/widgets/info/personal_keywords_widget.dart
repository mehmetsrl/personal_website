import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/personalInfo.dart';

// ignore: must_be_immutable
class PersonalKeywordsWidget extends StatefulWidget {
  final Function(List<String>) onKeywordSelected, onKeywordDelected;
  final PersonalInfo personalInfo;
  final List<String> preselectedKeywordsIds;
  List<Keyword> _unSelectedKeywords, _selectedKeywords;

  PersonalKeywordsWidget(this.personalInfo,
      {this.preselectedKeywordsIds,
      this.onKeywordSelected,
      this.onKeywordDelected}) {
    _unSelectedKeywords = List<Keyword>.from(personalInfo.keywords);
    _selectedKeywords = List<Keyword>();

    if (preselectedKeywordsIds != null)
      preselectedKeywordsIds.forEach((keywordId) {
        Keyword selectedKeyword = _unSelectedKeywords
            .singleWhere((keyword) => keyword.keywordId == keywordId);

        if (selectedKeyword != null) {
          _unSelectedKeywords.remove(selectedKeyword);
          _selectedKeywords.add(selectedKeyword);
        }
      });
  }

  @override
  _PersonalKeywordsWidgetState createState() => _PersonalKeywordsWidgetState();
}

class _PersonalKeywordsWidgetState extends State<PersonalKeywordsWidget> {
  _selectKeyword(Keyword selectedKeyword) {
    setState(() {
      widget._unSelectedKeywords.remove(selectedKeyword);
      widget._selectedKeywords.add(selectedKeyword);
    });
    print("onKeywordSelected: " + widget._selectedKeywords.length.toString());
    print("onKeywordSelected: " +
        List<String>.from(
                widget._selectedKeywords.map((keyword) => keyword.keywordId))
            .toString());
    if (widget.onKeywordSelected != null)
      widget.onKeywordSelected(List<String>.from(
          widget._selectedKeywords.map((keyword) => keyword.keywordId)));
  }

  _unSelectKeyword(Keyword selectedKeyword) {
    setState(() {
      widget._selectedKeywords.remove(selectedKeyword);
      widget._unSelectedKeywords.add(selectedKeyword);
    });

    if (widget.onKeywordDelected != null)
      widget.onKeywordDelected(widget._selectedKeywords
          .map((keyword) => keyword.keywordId)
          .toList());
  }

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
          Align(
            // alignment: Alignment.bottomLeft,
            child: Text(
              "Keywords",
              style: getTextStyle(TextTypes.cardTitle),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.lime[900],
              border: Border.all(width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    ...widget._selectedKeywords
                        .asMap()
                        .map(
                          (index, keyword) => MapEntry(
                            index,
                            GestureDetector(
                              child: Wrap(
                                runSpacing: 10,
                                spacing: 10,
                                children: [
                                  FittedBox(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            keyword.keywordName,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.lime,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => _unSelectKeyword(keyword),

                              // Provider.of<LayoutViewmodel>(context,
                              //         listen: false)
                              //     .navigateToProductsByKeywordId(
                              //         PortfolioRoute, keyword.keywordId),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ],
                ),
                (widget._selectedKeywords.length == 0 ||
                        widget._unSelectedKeywords.length == 0)
                    ? Container()
                    : Divider(
                        height: 30,
                        color: Colors.black,
                        thickness: 2,
                      ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    ...widget._unSelectedKeywords
                        .asMap()
                        .map(
                          (index, keyword) => MapEntry(
                            index,
                            GestureDetector(
                              child: Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 10,
                                spacing: 10,
                                children: [
                                  FittedBox(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            keyword.keywordName,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.lime,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => _selectKeyword(keyword),

                              // Provider.of<LayoutViewmodel>(context,
                              //         listen: false)
                              //     .navigateToProductsByKeywordId(
                              //         PortfolioRoute, keyword.keywordId),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
