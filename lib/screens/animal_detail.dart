import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalDetailView extends StatefulWidget {
  final String animalId;

  const AnimalDetailView({Key? key, required this.animalId}) : super(key: key);

  @override
  _AnimalDetailViewState createState() => _AnimalDetailViewState();
}

class _AnimalDetailViewState extends State<AnimalDetailView> {
  Map<String, dynamic>? animalData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAnimalDetails();
  }

  Future<void> fetchAnimalDetails() async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('animals')
          .doc(widget.animalId)
          .get();

      if (docSnapshot.exists) {
        setState(() {
          animalData = docSnapshot.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        print('No such document!');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching animal details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Animal Details')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading animal details...'),
            ],
          ),
        ),
      );
    }

    if (animalData == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Animal Details')),
        body: Center(
          child: Text(
            'Animal not found.',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(animalData!['name'] ?? 'No Name')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            animalData!['picture'] != null
                ? Image.network(
                    animalData!['picture'],
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey,
                  ),
            SizedBox(height: 20),
            Text(
              'Age: ${animalData!['age'] ?? 'Unknown'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}