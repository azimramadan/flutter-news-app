import 'package:flutter/material.dart';
import 'package:news_app/Views/web_view.dart';
import 'package:news_app/models/news_info_model.dart';

class DisplayNewsContainer extends StatelessWidget {
  const DisplayNewsContainer({super.key, required this.newsInfo});
  final NewsInfoModel newsInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewWidgetBuilder(
            url: newsInfo.url,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: newsInfo.urlToImage != null
                    ? Image.network(newsInfo.urlToImage!)
                    : Image.asset('assets/failed_to_load.jpg'),
              ),
              Text(
                newsInfo.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                newsInfo.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
