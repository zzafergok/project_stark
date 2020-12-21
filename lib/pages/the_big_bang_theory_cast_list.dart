import 'package:flutter/material.dart';
import 'package:project_stark/model/the_big_bang_theory_cast.dart';
import 'package:project_stark/services/the_big_bang_theory_services.dart';

class TheBigBangTheoryCastList extends StatefulWidget {
  @override
  _TheBigBangTheoryCastListState createState() =>
      _TheBigBangTheoryCastListState();
}

class _TheBigBangTheoryCastListState extends State<TheBigBangTheoryCastList> {
  //
  List<TheBigBangTheoryCast> _theBigBangTheoryCast;
  bool _loading;

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
          itemExtent: 300,
          itemBuilder: (context, index) {
            TheBigBangTheoryCast theBigBangTheoryCast =
                _theBigBangTheoryCast[index];
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
                                      theBigBangTheoryCast.character.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.orangeAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child:
                                      Text(theBigBangTheoryCast.person.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(theBigBangTheoryCast
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
                                theBigBangTheoryCast.person.birthday.toString(),
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
                                theBigBangTheoryCast.character.image.original),
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
