import 'package:flutter/material.dart';

class FarmAnimalsPage extends StatelessWidget {
  final List<Map<String, String>> farmAnimals = [
    {'name': 'Cow', 'image': 'assets/images/cow.png'},
    {'name': 'Goat', 'image': 'assets/images/goat.png'},
    {'name': 'Chicken', 'image': 'assets/images/chicken.png'},
    {'name': 'Duck', 'image': 'assets/images/duck.png'},
    {'name': 'Sheep', 'image': 'assets/images/sheep.png'},
    {'name': 'Horse', 'image': 'assets/images/horse.png'},
    {'name': 'Pig', 'image': 'assets/images/pig.png'},
  ];

  FarmAnimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Animals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: farmAnimals.length,
          itemBuilder: (context, index) {
            final animal = farmAnimals[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(animal['image']!),
                ),
                title: Text(
                  animal['name']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Click to explore adoption options.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to detailed animal info or actions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmAnimalDetailsPage(
                        animalName: animal['name']!,
                        animalImage: animal['image']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class FarmAnimalDetailsPage extends StatelessWidget {
  final String animalName;
  final String animalImage;

  const FarmAnimalDetailsPage({
    super.key,
    required this.animalName,
    required this.animalImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animalName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            animalImage,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'About $animalName',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Details about $animalName go here. Include its breed, age, and other specifics that may help adopters make an informed choice.',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for adoption/donation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Proceed to adopt or donate $animalName')),
                );
              },
              child: Text('Adopt/Donate $animalName'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
