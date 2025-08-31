import 'package:flutter/material.dart';
import 'home_screen.dart';

void main()
{
  runApp(TextToSpeech());
}

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
