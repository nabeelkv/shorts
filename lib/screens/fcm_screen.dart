import 'package:flutter/material.dart';

class FCMScreen extends StatelessWidget {
  final String image;
  final String title;

  const FCMScreen({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Image.network(image), Text(title)],
        ),
      ),
    );
  }
}
