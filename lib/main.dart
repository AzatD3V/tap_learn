import 'package:flutter/material.dart';
import 'package:tap_learn/presentation/screens/home_screen.dart';

void main() {
  runApp(TapLearn());
}

class TapLearn extends StatelessWidget {
  const TapLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Learn',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
