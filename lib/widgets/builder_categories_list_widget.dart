import 'package:flutter/material.dart';
import 'package:news_app/models/categorie_model.dart';
import 'package:news_app/widgets/categorie_widget.dart';

class BuilderCategoriesList extends StatelessWidget {
  const BuilderCategoriesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: ListView.builder(
          shrinkWrap: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesInfo.length,
          itemBuilder: (context, index) => Categorie(
            categorieInfo: categoriesInfo[index],
          ),
        ),
      ),
    );
  }
}

List<CategorieModel> categoriesInfo = [
  CategorieModel(
    nameCategorie: 'Business',
    imagePath: 'assets/business.avif',
  ),
  CategorieModel(
    nameCategorie: 'Entertaiment',
    imagePath: 'assets/entertaiment.avif',
  ),
  CategorieModel(
    nameCategorie: 'Health',
    imagePath: 'assets/health.avif',
  ),
  CategorieModel(
    nameCategorie: 'Science',
    imagePath: 'assets/science.avif',
  ),
  CategorieModel(
    nameCategorie: 'Technology',
    imagePath: 'assets/technology.jpeg',
  ),
  CategorieModel(
    nameCategorie: 'Sports',
    imagePath: 'assets/sports.avif',
  ),
];
