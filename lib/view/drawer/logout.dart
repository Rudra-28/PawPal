import 'package:flutter/material.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center( // Remove the Scaffold widget
        child: Text('chat View'), // Replace with the actual view content
      ),
    );
  }
}