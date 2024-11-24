import 'package:flutter/material.dart';
import '/models/animal.dart';

class AnimalDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the passed animal ID
    final String animalId =
        ModalRoute.of(context)!.settings.arguments as String;

    // Find the animal by ID from the dummy data
    Animal animal =
        Animal.getDummyAnimals().firstWhere((animal) => animal.id == animalId);

    return Scaffold(
      appBar: AppBar(title: Text(animal.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(animal.picture),
            SizedBox(height: 20),
            Text('Age: ${animal.age}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
