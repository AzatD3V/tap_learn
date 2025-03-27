import 'package:flutter/material.dart';
import 'package:tap_learn/data/sources/categories_data.dart';
import 'package:tap_learn/presentation/components/alphabet_comp.dart';
import 'package:tap_learn/presentation/components/animals_comp.dart';
import 'package:tap_learn/presentation/components/numbers_comp.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items =
        CategoriesData.categories[widget.category] ?? [];

    if (widget.category == "numbers") {
      return NumbersComp(items: items);
    } else if (widget.category == "alphabet") {
      return AlphabetComp(items: items);
    } else if (widget.category == "animals") {
      return AnimalsComp(items: items);
    } else {
      return Scaffold(body: Center(child: Text("Not implemented yet")));
    }
  }
}
