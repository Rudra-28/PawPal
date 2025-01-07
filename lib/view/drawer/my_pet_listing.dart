import 'package:flutter/material.dart';

class MyPetListingsScreen extends StatelessWidget {
  const MyPetListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Animals'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Adopted'),
              Tab(text: 'Donated'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AnimalListView(animals: adoptedAnimals), // Adopted animals
            AnimalListView(animals: donatedAnimals), // Donated animals
          ],
        ),
      ),
    );
  }
}

class AnimalListView extends StatelessWidget {
  final List<Map<String, String>> animals;

  const AnimalListView({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        final animal = animals[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(animal['imageUrl'] ?? '', width: 50, height: 50, fit: BoxFit.cover),
            title: Text(animal['name'] ?? ''),
            subtitle: Text('Age: ${animal['age']}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to animal details page
            },
          ),
        );
      },
    );
  }
}

// Example data
final adoptedAnimals = [
  {'name': 'Bella', 'age': '2 years', 'imageUrl': 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649_640.jpg'},
  {'name': 'Max', 'age': '3 years', 'imageUrl': 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649_640.jpg'},
];

final donatedAnimals = [
  {'name': 'Charlie', 'age': '1 year', 'imageUrl': 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649_640.jpg'},
  {'name': 'Luna', 'age': '2 years', 'imageUrl': 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649_640.jpg'},
];
