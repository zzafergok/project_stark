import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_stark/model/pokedex.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;

  Future<Pokedex> getPokemon() async {
    final response = await http.get(url);
    final decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
      ),
      body: FutureBuilder(
        future: getPokemon(),
        builder: (context, AsyncSnapshot<Pokedex> cominPokedex) {
          if (cominPokedex.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 1,
              children: cominPokedex.data.pokemon.map((poke) {
                return Container(
                  color: Colors.amberAccent,
                  child: Card(
                    elevation: 6,
                    margin: EdgeInsets.all(12),
                    color: Colors.teal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 32, right: 8, top: 50, bottom: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Prev Evolution",
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: poke.prevEvolution != null
                                            ? poke.prevEvolution
                                                .map((evolution) => Chip(
                                                    backgroundColor: Colors
                                                        .lightBlue.shade500,
                                                    label: Text(
                                                      evolution.name,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )))
                                                .toList()
                                            : [
                                                Chip(
                                                    label: Text(
                                                        "The first version"))
                                              ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next Evolution",
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: poke.nextEvolution != null
                                            ? poke.nextEvolution
                                                .map((evolution) => Chip(
                                                    backgroundColor: Colors
                                                        .amberAccent.shade400,
                                                    label: Text(
                                                      evolution.name,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )))
                                                .toList()
                                            : [
                                                Chip(
                                                    label: Text(
                                                        "The last version"))
                                              ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(poke.img),
                                  Text(poke.name),
                                ],
                              )),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
