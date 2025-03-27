import 'package:flutter/material.dart';
import 'package:tap_learn/core/utils/audio_service.dart';

class AnimalsComp extends StatefulWidget {
  final List<Map<String, String>> items;
  const AnimalsComp({super.key, required this.items});

  @override
  State<AnimalsComp> createState() => _AnimalsCompState();
}

class _AnimalsCompState extends State<AnimalsComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(title: Text("Animals")),
      body: GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 1, // **Kare hücreleri koru**
        ),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          return item.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Arka plan resmi
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item["image"]!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // Alt kısımdaki beyaz bilgi kutusu
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                          border: Border(
                            bottom: BorderSide(color: Colors.black54, width: 1),
                            left: BorderSide(color: Colors.black54, width: 1),
                            right: BorderSide(color: Colors.black54, width: 1),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          item["name"]!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    // Ses butonu
                    Positioned(
                      right: 5,
                      top: 0,
                      child: IconButton(
                        onPressed: () => AudioService.play(item["sound"]!),
                        icon: Icon(
                          Icons.volume_up,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : Center(child: Text("No data"));
        },
      ),
    );
  }
}
