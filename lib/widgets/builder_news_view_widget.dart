import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_info_model.dart';
import 'package:news_app/service/get_news_service.dart';
import 'package:news_app/widgets/builder_list_news_widget.dart';
import 'package:news_app/widgets/builder_categories_list_widget.dart';

class BuilderNewsView extends StatefulWidget {
  const BuilderNewsView({super.key});
  @override
  State<BuilderNewsView> createState() => _BuilderNewsViewState();
}

class _BuilderNewsViewState extends State<BuilderNewsView> {
  var future;
  @override
  void initState() {
    super.initState();

    future =
        GetNewsModel(dio: Dio()).getListOfSpecificNews(categorie: 'General');
  }

  Future<void> _reloadData() async {
    setState(() {
      future = GetNewsModel(dio: Dio()).getListOfSpecificNews(
          categorie: 'General'); // إعادة تعيين Future لإعادة التحميل
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Color(0xffFFB059),
      onRefresh: _reloadData,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: BuilderCategoriesList(),
          ),
          FutureBuilder<List<NewsInfoModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                    child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 220),
                      child: CircularProgressIndicator(
                        color: Color(0xffFFB059),
                      )),
                ));
              } else if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return BuilderListOfNews(newsInfo: snapshot.data!);
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Check your internet connection.'),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ],
                        ),
                        behavior: SnackBarBehavior.fixed,
                        duration: Duration(days: 1),
                      ),
                    );
                  });
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          IconButton(
                              iconSize: 45,
                              onPressed: () {
                                _reloadData();
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.black,
                              )),
                          Text('Check connection and click to redownload'),
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 220),
                      child: Text(
                        'oops there was an error, try later.',
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

    // return CustomScrollView(
    //   physics: const BouncingScrollPhysics(),
    //   slivers: [
    //     const SliverToBoxAdapter(
    //       child: BuilderCategoriesList(),
    //     ),
    //     isLoading == true
    //         ? const SliverToBoxAdapter(
    //             child: Center(
    //             child: Padding(
    //                 padding: EdgeInsets.only(top: 220),
    //                 child: CircularProgressIndicator(
    //                   color: Color(0xffFFB059),
    //                 )),
    //           ))
    //         : newsInfo.isEmpty
    //             ? const SliverToBoxAdapter(
    //                 child: Center(
    //                   child: Padding(
    //                     padding: EdgeInsets.only(top: 220),
    //                     child: Text(
    //                       'oops there was an error, try later.',
    //                       style: TextStyle(color: Colors.red, fontSize: 22),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             : BuilderListOfNews(newsInfo: newsInfo)
    //   ],
    // );