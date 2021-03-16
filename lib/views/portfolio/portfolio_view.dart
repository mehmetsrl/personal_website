import 'dart:js';

import 'package:flutter/material.dart';
import 'package:personal_website/widgets/info/personal_keywords_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/viewmodels/portfolio/portfolio_viewmodel.dart';
import 'package:personal_website/widgets/products/product_list.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortfolioView extends StatelessWidget {
  // Function(List<String>) _onKeywordLisUpdated;
  final List<String> keywordList;
  PortfolioView({
    Key key,
    this.keywordList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutViewmodel layoutModel =
        Provider.of<LayoutViewmodel>(context, listen: true);

    return ViewModelProvider<PortfolioViewModel>.withConsumer(
        onModelReady: (model) => model.getProducts(),
        builder: (context, model, child) => ScreenTypeLayout(
            desktop:
                _DesktopView(layoutModel: layoutModel, portfolioModel: model),
            mobile:
                _MovileView(layoutModel: layoutModel, portfolioModel: model)),
        viewModelBuilder: () => PortfolioViewModel(
            productsFilePath: layoutModel.metafile.productListPath,
            searchKeywords: keywordList));
  }
}

class _DesktopView extends StatelessWidget {
  final LayoutViewmodel layoutModel;
  final PortfolioViewModel portfolioModel;
  const _DesktopView(
      {@required this.layoutModel, @required this.portfolioModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Products",
              style: getTextStyle(TextTypes.title),
            ),
            Text(
              "Here are my products.",
              style: getTextStyle(TextTypes.text),
            ),
          ],
        )),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ScrollableContent(
                    model: portfolioModel,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                PersonalKeywordsWidget(
                  layoutModel.personalInfo,
                  preselectedKeywordsIds: portfolioModel.searchKeywords,
                  onKeywordSelected: (selectedWordIds) =>
                      {portfolioModel.updateSearchKeywords(selectedWordIds)},
                  onKeywordDelected: (selectedWordIds) =>
                      {portfolioModel.updateSearchKeywords(selectedWordIds)},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MovileView extends StatelessWidget {
  final LayoutViewmodel layoutModel;
  final PortfolioViewModel portfolioModel;
  const _MovileView(
      {@required this.layoutModel, @required this.portfolioModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Products",
              style: getTextStyle(TextTypes.title),
            ),
            Text(
              "Here are my products.",
              style: getTextStyle(TextTypes.text),
            ),
          ],
        )),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                PersonalKeywordsWidget(
                  layoutModel.personalInfo,
                  preselectedKeywordsIds: portfolioModel.searchKeywords,
                  onKeywordSelected: (selectedWordIds) =>
                      {portfolioModel.updateSearchKeywords(selectedWordIds)},
                  onKeywordDelected: (selectedWordIds) =>
                      {portfolioModel.updateSearchKeywords(selectedWordIds)},
                ),
                SizedBox(
                  height: 50,
                ), ScrollableContent(
                    model: portfolioModel,
                  ),
              ],
            ),
          ),
        ),

        // Expanded(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Expanded(
        //         child: ScrollableContent(
        //           model: portfolioModel,
        //         ),
        //       ),
        //       SizedBox(
        //         width: 10,
        //       ),

        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class ScrollableContent extends StatelessWidget {
  final PortfolioViewModel model;
  const ScrollableContent({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: model.busy
            ? Center(child: CircularProgressIndicator())
            : ProductList(products: model.products),
      ),
    );
  }
}
