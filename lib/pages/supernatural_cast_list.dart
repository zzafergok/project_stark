import 'package:flutter/material.dart';
import 'package:project_stark/model/supernatural_cast.dart';
import 'package:project_stark/services/supernatural_services.dart';

class SupernaturalCastList extends StatefulWidget {
  @override
  _SupernaturalCastListState createState() => _SupernaturalCastListState();
}

class _SupernaturalCastListState extends State<SupernaturalCastList> {
  List<SupernaturalCast> _supernaturalCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getSupernaturalCast().then((supernaturalCast) {
      setState(() {
        _supernaturalCast = supernaturalCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Supernatural Cast'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == _supernaturalCast ? 0 : _supernaturalCast.length,
          itemBuilder: (context, index) {
            SupernaturalCast supernaturalCast = _supernaturalCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                supernaturalCast.character.name,
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
                          supernaturalCast.character.image.original),
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
                        Text(supernaturalCast.person.name),
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
                        Text(supernaturalCast.person.birthday.toString()),
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
                        Text(supernaturalCast.person.country.code +
                            " / " +
                            supernaturalCast.person.country.name),
                      ],
                    ),
                  ),
                ),
                Container(height: 15, color: Colors.black54)
              ],
            );
          },
        ),
      ),
    );
  }
}
