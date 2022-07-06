import 'package:flutter/material.dart';
import 'PokemonJson.dart';

class DetalhesPokemons extends StatelessWidget {
  const DetalhesPokemons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonJson detalhes =
        ModalRoute.of(context)!.settings.arguments as PokemonJson;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          detalhes.name ?? '',
        ),
      ),
      body: Card(
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 110,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 241, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '#${detalhes.number}',
                        ),
                      ),
                    ),
                    Image.network(
                      '${detalhes.thumbnailImage}',
                      width: 200,
                      height: 500,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${detalhes.description}',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Tipo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${detalhes.type}',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fraquezas:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${detalhes.weakness}')
            ],
          ),
        ),
      ),
    );
  }
}
