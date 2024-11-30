import 'package:flutter/material.dart';
import 'package:news_app/models/news_info_model.dart';
import 'package:news_app/widgets/display%20_news_container_widget.dart';

class BuilderListOfNews extends StatelessWidget {
  const BuilderListOfNews({
    super.key,
    required this.newsInfo,
  });

  final List<NewsInfoModel> newsInfo;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return DisplayNewsContainer(
            newsInfo: newsInfo[index],
            // viewsContainerInfo: viewsContainerInfo[index],
          );
        },
        childCount: newsInfo.length,
      ),
    );
  }
}
