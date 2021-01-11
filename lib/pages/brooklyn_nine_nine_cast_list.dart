import 'package:flutter/material.dart';
import 'package:project_stark/services/brooklyn_nine_nine_services.dart';
import 'package:project_stark/model/brooklyn_nine_nine_cast.dart';

class BrooklynNineNineCastList extends StatefulWidget {
  BrooklynNineNineCastList() : super();

  @override
  _BrooklynNineNineCastListState createState() =>
      _BrooklynNineNineCastListState();
}

class _BrooklynNineNineCastListState extends State<BrooklynNineNineCastList> {
  List<BrooklynNineNineCast> _brooklynNineNineCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getBrooklynNineNineCast().then((brooklynnineNineCast) {
      setState(() {
        _brooklynNineNineCast = brooklynnineNineCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Brooklyn Nine Nine Cast'),
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount:
              null == _brooklynNineNineCast ? 0 : _brooklynNineNineCast.length,
          itemBuilder: (context, index) {
            BrooklynNineNineCast brooklynNineNineCast =
                _brooklynNineNineCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                brooklynNineNineCast.character.name,
                style: TextStyle(color: Colors.black),
              ),
              children: [
                Container(
                  height: 250,
                  padding: EdgeInsets.all(175),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          brooklynNineNineCast.character.image.original),
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
                        Text(brooklynNineNineCast.person.name),
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
                        Text(brooklynNineNineCast.person.birthday.toString()),
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
                        Text(brooklynNineNineCast.person.country.name),
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
