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
      DocumentSnapshot docSnapshot =
          await FirebaseFirestore.instance.collection('animals').doc(widget.animalId).get();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Details'),
        backgroundColor: Colors.purple[800],
      ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.purple[400],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : animalData == null
              ? Center(
                  child: Text(
                    'Animal not found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red[400],
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          animalData!['name'] ?? 'No Name',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Age: ${animalData!['age'] ?? 'Unknown'}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.purple[600],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        animalData!['picture'] != null
                            ? ClipOval(
                                child: Image.network(
                                  animalData!['picture'],
                                  width: 260,
                                  height: 260,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.image,
                                size: 100,
                                color: Colors.grey,
                              ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
