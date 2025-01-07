import 'package:flutter/material.dart';

class DogPreferencesPage extends StatefulWidget {
  const DogPreferencesPage({super.key});

  @override
  _DogPreferencesPageState createState() => _DogPreferencesPageState();
}

class _DogPreferencesPageState extends State<DogPreferencesPage> {
  int _currentStep = 0;

  String? _selectedAge;
  String? _selectedBreed;
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Your Preferences'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            // Handle completion
            print('Preferences: Age: $_selectedAge, Breed: $_selectedBreed, Color: $_selectedColor');
            Navigator.pop(context, {
              'age': _selectedAge,
              'breed': _selectedBreed,
              'color': _selectedColor,
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          } else {
            Navigator.pop(context); // Go back if on the first step
          }
        },
        steps: [
          Step(
            title: const Text('Select Age'),
            content: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Preferred Age'),
              items: ['3-8 months', '9-12 months', '1-2 years', '2-4 years']
                  .map((age) => DropdownMenuItem(
                        value: age,
                        child: Text(age),
                      ))
                  .toList(),
              onChanged: (value) => _selectedAge = value,
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Select Breed'),
            content: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Preferred Breed',
                hintText: 'e.g., Labrador, Beagle',
              ),
              onChanged: (value) => _selectedBreed = value,
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Select Color'),
            content: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Preferred Color',
                hintText: 'e.g., Black, White, Brown',
              ),
              onChanged: (value) => _selectedColor = value,
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
