import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/PokemonJson.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonJson> pokemonsList = [];
  bool carregando = true;

  @override
  void initState() {
    _pokemonI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pokedex'),
            SizedBox(
              width: 35,
              child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: pokemonsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/descricao', arguments: pokemonsList[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      '${pokemonsList[index].thumbnailImage}',
                      width: 95,
                      height: 95,
                    ),
                    Column(
                      children: [
                        Text(
                          pokemonsList[index].name ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 125,
                    ),
                    Text(
                      '#${pokemonsList[index].number ?? ''}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _pokemonI() {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then(
      (value) {
        if (value.statusCode == 200) {
          setState(
            () {
              Map json = JsonDecoder().convert(value.body);
              (json['data'] as List).forEach(
                (element) {
                  pokemonsList.add(PokemonJson.fromJson(element));
                },
              );
              carregando = false;
            },
          );
        }
      },
    );
  }
}
