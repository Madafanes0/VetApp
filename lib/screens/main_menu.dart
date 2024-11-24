import 'package:flutter/material.dart';
import '../models/animal.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Animal> animals = Animal.getDummyAnimals(); // Dummy data

    return Scaffold(
      appBar: AppBar(
        title: Text('VetApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addAnimal'); // Navigate to AddAnimal screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(animals[index].name),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/animalDetail',
                arguments: animals[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
