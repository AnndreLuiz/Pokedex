import 'package:flutter/material.dart';
import 'package:pokedex/pages/HomePage.dart';
import 'package:pokedex/pages/DetalhesPoke.dart';


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