import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_bar_widget.dart';
import 'package:news_app/widgets/builder_categorie_view_widget.dart';

class CategorieViewBuilder extends StatelessWidget {
  const CategorieViewBuilder({super.key, required this.catergorieName});
  final String catergorieName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(text: catergorieName),
      body: BuilderCategorieNewsView(categorie: catergorieName),
    );
  }
}
