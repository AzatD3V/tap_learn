import 'package:flutter/material.dart';
import 'package:tap_learn/data/sources/categories_data.dart';
import 'package:tap_learn/presentation/screens/detail_screen.dart';
import 'package:tap_learn/presentation/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoryNames = CategoriesData.categories.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade900, Colors.blue],
                stops: [0, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
              ),
              itemCount: categoryNames.length,
              itemBuilder: (context, index) {
                String category = categoryNames[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CategoryDetailScreen(category: category),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                            spreadRadius: 0.3,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 3,
                                  spreadRadius: 0.2,
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  CategoriesData.categoryImages[category] ?? "",
                                ),
                              ),
                            ),
                          ),
                          Text(CategoriesData.categoryTitleDE[category] ?? ""),
                          Text(CategoriesData.categoryTitleTR[category] ?? ""),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          CustomAppBar(title: "Tap Learn"),
        ],
      ),
    );
  }
}
