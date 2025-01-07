import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPet extends StatefulWidget {
  const UploadPet({super.key});

  @override
  _UploadPetState createState() => _UploadPetState();
}

class _UploadPetState extends State<UploadPet> {
  final _formKey = GlobalKey<FormState>();

  // ... other form fields and state variables
  File? _image;

  Future _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Animal Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Basic Info
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                // ... validation and other properties
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Breed'),
                // ... validation and other properties
              ),
              // ... age, gender, etc.

              // Personality Traits
              TextFormField(
                decoration: const InputDecoration(labelText: 'Temperament'),
                // ... validation and other properties
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Energy Level'),
                // ... validation and other properties
              ),

              // Image
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Choose Image'),
              ),
              if (_image != null) Image.file(_image!),

              // Most Common Place
              TextFormField(
                decoration: const InputDecoration(labelText: 'Common Place'),
                // ... validation and other properties
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // Validate form and submit data
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}