import 'package:flutter/material.dart';
import 'package:pawpalforpets/view/category_widget.dart';
import 'package:pawpalforpets/view/dog_view.dart';

class BottomCategoryScroll extends StatelessWidget {
  const BottomCategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryWidget(
                icon: Icons.pets,
                label: 'dog',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 2',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 1',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 2',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 1',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 2',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 1',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 2',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 1',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
              CategoryWidget(
                icon: Icons.pets,
                label: 'Category 2',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DogView()));
                },
                isLarge: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Add more rows as needed
        ],
      ),
    );
  }
}
