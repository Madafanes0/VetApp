import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<Map<String, dynamic>> animals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAnimals();
  }

  Future<void> fetchAnimals() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('animals').get();
      final animalList = querySnapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      setState(() {
        animals = animalList;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching animals: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('VetApp')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading animals...'),
            ],
          ),
        ),
      );
    }

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
          final animal = animals[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/animalDetail',
                arguments: animal['id'], // Pass the animal ID to the details screen
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                animal['name'] ?? 'Unknown Animal',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }
}