import 'package:flutter/material.dart';

class DonationView extends StatelessWidget {
  const DonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center( // Remove the Scaffold widget
        child: Text('chat View'), // Replace with the actual view content
      ),
    );
  }
}