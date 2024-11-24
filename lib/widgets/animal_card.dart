import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final String name;
  final String age;
  final String picture;

  const AnimalCard(
      {Key? key, required this.name, required this.age, required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(picture),
          Text(name),
          Text(age),
        ],
      ),
    );
  }
}
