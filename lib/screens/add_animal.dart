import 'package:flutter/material.dart';
import '/models/animal.dart';

class AddAnimalScreen extends StatefulWidget {
  @override
  _AddAnimalScreenState createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _addAnimal() {
    // For now, we'll just print the data
    print('Added Animal: ${_nameController.text}, Age: ${_ageController.text}');
    Navigator.pop(context); // Go back to the main menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Animal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Animal Name'),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) => value!.isEmpty ? 'Enter an age' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addAnimal();
                  }
                },
                child: Text('Add Animal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
