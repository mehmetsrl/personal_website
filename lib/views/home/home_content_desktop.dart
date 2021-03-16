import 'package:flutter/material.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/viewmodels/home_viewmodel.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/widgets/info/personal_competencies_widget.dart';
import 'package:personal_website/widgets/info/personal_detail_widget.dart';
import 'package:personal_website/widgets/info/personal_keywords_widget.dart';
import 'package:personal_website/widgets/info/personal_languages_widget.dart';
import 'package:personal_website/widgets/web_buton/web_button.dart';
import 'package:provider/provider.dart';

class HomeContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LayoutViewmodel layoutModel =
        Provider.of<LayoutViewmodel>(context, listen: false);
    HomeViewModel homeModel =
        Provider.of<HomeViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: PersonalDetailWidget(layoutModel.personalInfo),
          ),
          // Flex(
          //   direction: Axis.vertical,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Expanded(child: PersonalCompetenciesWidget(pInfo)),
          //     // SizedBox(
          //     //   // width: 200,
          //     //   height: 100,
          //     // ),
          //     Center(
          //       child: CallToAction('Support me!'),
          //     ),
          //   ],
          // ),
          SizedBox(width:20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(child:
              PersonalCompetenciesWidget(layoutModel.personalInfo),
              SizedBox(
                height: 10,
              ),
              PersonalLanguagesWidget(layoutModel.personalInfo),
              SizedBox(
                height: 10,
              ),
              PersonalKeywordsWidget(
                layoutModel.personalInfo,
                onKeywordSelected: (selectedWordIds) => {
                  Provider.of<LayoutViewmodel>(context, listen: false)
                      .navigateToProductsByKeywordId(
                          PortfolioRoute, selectedWordIds),
                },
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    WebButton(
                      'Contact me!',
                      onClick: () => 
                      layoutModel.navigateTo(ContactRoute),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );

    // Row(
    //   children: <Widget>[
    //     Expanded(
    //         child: PersonalDetailWidget(
    //             Provider.of<LayoutViewmodel>(context, listen: false)
    //                 .personalInfo)),
    //     Expanded(
    //       child: Center(
    //         child: CallToAction('Support me!'),
    //       ),
    //     )
    //   ],
    // );
  }
}
