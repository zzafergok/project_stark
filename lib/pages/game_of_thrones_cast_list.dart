import 'package:flutter/material.dart';
import 'package:project_stark/model/game_of_thrones_cast.dart';
import 'package:project_stark/services/game_of_thrones_services.dart';

class GameOfThronesCastList extends StatefulWidget {
  @override
  _GameOfThronesCastListState createState() => _GameOfThronesCastListState();
}

class _GameOfThronesCastListState extends State<GameOfThronesCastList> {
  List<GameOfThronesCast> _gameOfThronesCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getGameOfThronesCast().then((gameOfThronesCast) {
      setState(() {
        _gameOfThronesCast = gameOfThronesCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Game Of Thrones Cast'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == _gameOfThronesCast ? 0 : _gameOfThronesCast.length,
          itemBuilder: (context, index) {
            GameOfThronesCast gameOfThronesCast = _gameOfThronesCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                gameOfThronesCast.character.name,
                style: TextStyle(color: Colors.black),
              ),
              children: [
                Container(
                  height: 225,
                  padding: EdgeInsets.all(175),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          gameOfThronesCast.character.image.original),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Gercek Adi : "),
                        Text(gameOfThronesCast.person.name),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dogum Gunu : "),
                        Text(gameOfThronesCast.person.birthday.toString()),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ulkesi: "),
                        Text(gameOfThronesCast.person.country.code +
                            " / " +
                            gameOfThronesCast.person.country.name),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  color: Colors.black54,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
