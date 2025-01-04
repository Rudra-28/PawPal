import 'package:flutter/material.dart';
import 'package:pawpalforpets/view/dog_view.dart'; 

class CategoryScrollView extends StatelessWidget {
  const CategoryScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryWidget(
                icon: Icons.pets,
                label: 'Dogs',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),
            CategoryWidget(
                icon: Icons.pets,
                label: 'Cats',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),
            CategoryWidget(
                icon: Icons.pets,
                label: 'Birds',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),
            CategoryWidget(
                icon: Icons.pets,
                label: 'Dogs',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),
            CategoryWidget(
                icon: Icons.pets,
                label: 'Cats',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),
            CategoryWidget(
                icon: Icons.pets,
                label: 'Birds',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                }),
            const SizedBox(width: 10),

            // Add more CategoryWidgets as needed
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isLarge;

  const CategoryWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isLarge= false,
  });

  @override
  Widget build(BuildContext context) {

    final double width = isLarge ? 170: 110;
    final double height = isLarge ? 170: 110;
    final double iconSize = isLarge ? 60: 40;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
