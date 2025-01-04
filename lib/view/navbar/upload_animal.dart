import 'package:flutter/material.dart';

class UploadAnimalView extends StatefulWidget {
  const UploadAnimalView({super.key});

  @override
  State<UploadAnimalView> createState() => _UploadAnimalViewState();
}

class _UploadAnimalViewState extends State<UploadAnimalView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Add more fields as needed (e.g., for image upload, location, etc.)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Animal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( // To prevent overflow errors
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the animal\'s name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _breedController,
                  decoration: const InputDecoration(labelText: 'Breed'),
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the data and upload to Firebase
                      // You can access the data using the controllers:
                      // _nameController.text, _breedController.text, etc.
                      print('Uploading animal details...');
                    }
                  },
                  child: const Text('Upload'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}