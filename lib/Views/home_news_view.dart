import 'package:flutter/material.dart';
import 'package:news_app/widgets/builder_news_view_widget.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News', style: TextStyle(fontSize: 28)),
            Text(
              'Cloud',
              style: TextStyle(color: Color(0xffFFB059), fontSize: 28),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: BuilderNewsView(),
      ),
    );
  }
}
