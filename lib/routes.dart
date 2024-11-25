import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_menu.dart';
import 'screens/animal_detail.dart';
import 'screens/add_animal.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case '/mainMenu':
      return MaterialPageRoute(builder: (_) => MainMenu());
    case '/addAnimal':
      return MaterialPageRoute(builder: (_) => AddAnimalScreen());
    case '/animalDetail':
      final args = settings.arguments as String; // Expecting animalId
      return MaterialPageRoute(
        builder: (_) => AnimalDetailView(animalId: args),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}