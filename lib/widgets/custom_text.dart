import 'package:flutter/material.dart';

class Headline1 extends StatelessWidget {
  const Headline1({super.key, required this.text});
  final TextStyle textstyle = const TextStyle(
      fontSize: 26,
      color: Color.fromARGB(255, 226, 221, 221),
      fontWeight: FontWeight.bold,
      letterSpacing: 2);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textstyle,
    );
  }
}

class CategoryTitle extends StatelessWidget {
  CategoryTitle({super.key, required this.title});
  final String title;
  final TextStyle categorytextstyle =
      TextStyle(fontSize: 20, color: Colors.grey[500], letterSpacing: 1.5);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: categorytextstyle,
      textAlign: TextAlign.center,
    );
  }
}
