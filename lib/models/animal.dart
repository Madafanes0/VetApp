class Animal {
  final String id;
  final String name;
  final String age;
  final String picture;

  Animal(
      {required this.id,
      required this.name,
      required this.age,
      required this.picture});

  // Dummy data model
  static List<Animal> getDummyAnimals() {
    return [
      Animal(
          id: '1',
          name: 'Bella',
          age: '3',
          picture: 'https://example.com/dog1.jpg'),
      Animal(
          id: '2',
          name: 'Max',
          age: '2',
          picture: 'https://example.com/dog2.jpg'),
      Animal(
          id: '3',
          name: 'Charlie',
          age: '4',
          picture: 'https://example.com/dog3.jpg'),
    ];
  }
}
