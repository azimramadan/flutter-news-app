import 'package:flutter/material.dart';
import 'package:news_app/Views/categorie_view.dart';
import 'package:news_app/models/categorie_model.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key, required this.categorieInfo});
  final CategorieModel categorieInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategorieViewBuilder(
            catergorieName: categorieInfo.nameCategorie,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(categorieInfo.imagePath), fit: BoxFit.fill),
        ),
        width: 165,
        height: 100,
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          categorieInfo.nameCategorie,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
