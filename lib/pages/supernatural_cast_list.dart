import 'package:flutter/material.dart';
import 'package:project_stark/model/supernatural_cast.dart';
import 'package:project_stark/services/supernatural_services.dart';

class SupernaturalCastList extends StatefulWidget {
  @override
  _SupernaturalCastListState createState() => _SupernaturalCastListState();
}

class _SupernaturalCastListState extends State<SupernaturalCastList> {
  //
  List<SupernaturalCast> _supernaturalCast;
  bool _loading;

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
          itemExtent: 300,
          itemBuilder: (context, index) {
            SupernaturalCast supernaturalCast = _supernaturalCast[index];
            return Container(
              color: Colors.blueGrey,
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(12),
                color: Colors.amber,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8, top: 50, bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(supernaturalCast.character.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.orangeAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(supernaturalCast.person.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(supernaturalCast
                                      .person.country.name
                                      .toString())),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 35, top: 1.5),
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(
                                supernaturalCast.person.birthday.toString(),
                              )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                supernaturalCast.character.image.original),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            );
          },
          //itemCount: _brooklynNineNineCast.length,
        ),
      ),
    );
  }
}
