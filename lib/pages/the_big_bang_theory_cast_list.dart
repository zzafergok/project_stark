import 'package:flutter/material.dart';
import 'package:project_stark/model/the_big_bang_theory_cast.dart';
import 'package:project_stark/services/the_big_bang_theory_services.dart';

class TheBigBangTheoryCastList extends StatefulWidget {
  @override
  _TheBigBangTheoryCastListState createState() =>
      _TheBigBangTheoryCastListState();
}

class _TheBigBangTheoryCastListState extends State<TheBigBangTheoryCastList> {
  List<TheBigBangTheoryCast> _theBigBangTheoryCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getTheBigBangTheoryCast().then((theBigBangTheoryCast) {
      setState(() {
        _theBigBangTheoryCast = theBigBangTheoryCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'The Big Bang Theory Cast'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount:
              null == _theBigBangTheoryCast ? 0 : _theBigBangTheoryCast.length,
          itemBuilder: (context, index) {
            TheBigBangTheoryCast theBigBangTheoryCast =
                _theBigBangTheoryCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                theBigBangTheoryCast.character.name,
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
                          theBigBangTheoryCast.character.image.original),
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
                        Text(theBigBangTheoryCast.person.name),
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
                        Text(theBigBangTheoryCast.person.birthday.toString()),
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
                        Text(theBigBangTheoryCast.person.country.code +
                            " / " +
                            theBigBangTheoryCast.person.country.name),
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
