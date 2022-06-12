import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tp_cm_2022/repositories/preferences_repository.dart';

import 'ui/screens/home.dart';
import 'ui/screens/viewpokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/viewPokemon': (context) => const ViewPokemon(),
      },
      initialRoute: '/home',
    );
  }
}
