import 'package:flutter/material.dart';
import 'package:tap_learn/core/utils/audio_service.dart';

class NumbersComp extends StatefulWidget {
  final List<Map<String, String>> items;

  const NumbersComp({super.key, required this.items});

  @override
  State<NumbersComp> createState() => _NumbersCompState();
}

class _NumbersCompState extends State<NumbersComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: (widget.items.length / 2).ceil(), // 2'şerli grup oluştur
        itemBuilder: (context, index) {
          int firstIndex = index * 2; // Sol taraftaki öğe
          int secondIndex = firstIndex + 1; // Sağ taraftaki öğe
          final itemLeft = widget.items[firstIndex];
          final itemRight =
              secondIndex < widget.items.length
                  ? widget.items[secondIndex]
                  : null;
          return Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Yan yana hizalama
            children: [
              buildCategoryCard(
                firstIndex,
                isLeft: true,
                onTap: () => AudioService.play(itemLeft["sound"]),
                data: itemLeft["name"] ?? "",
              ), // Sol taraftaki kart

              if (secondIndex <
                  widget
                      .items
                      .length) // Eğer liste dışına çıkmıyorsa sağ tarafa ekle
                buildCategoryCard(
                  secondIndex,
                  isLeft: false,
                  onTap: () => AudioService.play(itemRight["sound"]),
                  data: itemRight!["name"] ?? "",
                )
              else
                SizedBox(width: 50), // Boş bir alan ekleyerek hizalamayı koru
            ],
          );
        },
      ),
    );
  }
}

Widget buildCategoryCard(
  int index, {
  required bool isLeft,
  required GestureTapCallback onTap,
  required String data,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      width: 150,
      height: 100,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            index.toString(),
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(data),
        ],
      ),
    ),
  );
}
