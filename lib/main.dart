import 'package:flutter/material.dart';
import 'package:pokedex/HomePage.dart';
import 'package:pokedex/DetalhesPoke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/descricao': (context) => const DetalhesPokemons(),
      },
      initialRoute: '/home',
    );
  }
}
