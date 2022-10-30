import 'package:api/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  CustomCircleAvatar(
      {super.key,
      required this.backImage,
      required this.title,
      required this.onTap});
  final String title;
  final String backImage;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0),
            backgroundImage: AssetImage(backImage),
            radius: 50,
          ),
        ),
        CategoryTitle(title: title)
      ],
    );
  }
}
