import 'package:flutter/material.dart';
import 'package:shorts/screens/news_card_list.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String categoryId;
  final BuildContext nabeel;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.categoryId,
    required this.nabeel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pop(nabeel);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsCardsList(
                  categoryName: label,
                  categoryId: categoryId,
                  nabeel: context)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF212121),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: const Color(0xFF383838))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 35.0, color: Colors.white),
            const SizedBox(height: 10.0),
            Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Baloo Chettan 2', color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}
