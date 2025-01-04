import 'package:flutter/material.dart';

class PetListingView extends StatelessWidget {
  const PetListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center( // Remove the Scaffold widget
        child: Text('chat View'), // Replace with the actual view content
      ),
    );
  }
}