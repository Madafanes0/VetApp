import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_menu.dart';
import 'screens/animal_detail.dart';
import 'screens/add_animal.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/mainMenu': (context) => MainMenu(),
  '/animalDetail': (context) => AnimalDetailView(),
  '/addAnimal': (context) => AddAnimalScreen(),
};
