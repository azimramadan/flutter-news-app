import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/news_info_model.dart';

class GetNewsModel {
  final Dio dio;
  final String baseUrl = 'https://newsapi.org/v2';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  GetNewsModel({required this.dio});

  Future<List<NewsInfoModel>> getListOfSpecificNews(
      {required String categorie}) async {
    try {
      Map<String, dynamic> response =
          (await dio.get('$baseUrl/everything?q=$categorie&apiKey=$apiKey'))
              .data;
      List<NewsInfoModel> listOfNews = [];
      for (Map news in response['articles']) {
        listOfNews.add(NewsInfoModel.fromJson(news));
      }
      return listOfNews;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
