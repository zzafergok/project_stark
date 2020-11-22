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
  //
  List<BrooklynNineNineCast> _brooklynNineNineCast;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
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
          itemExtent: 300,
          itemBuilder: (context, index) {
            BrooklynNineNineCast brooklynNineNineCast =
                _brooklynNineNineCast[index];
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
                                  child: Text(
                                      brooklynNineNineCast.character.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.orangeAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child:
                                      Text(brooklynNineNineCast.person.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(brooklynNineNineCast
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
                                brooklynNineNineCast.person.birthday.toString(),
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
                                brooklynNineNineCast.character.image.original),
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
