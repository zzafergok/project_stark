import 'package:flutter/material.dart';
import 'package:project_stark/model/the_simpsons_cast.dart';
import 'package:project_stark/services/the_simpsons_services.dart';

class TheSimpsonsCastList extends StatefulWidget {
  @override
  _TheSimpsonsCastListState createState() => _TheSimpsonsCastListState();
}

class _TheSimpsonsCastListState extends State<TheSimpsonsCastList> {
  //
  List<TheSimpsonsCast> _theSimpsonsCast;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getTheSimpsonsCast().then((theSimpsonsCast) {
      setState(() {
        _theSimpsonsCast = theSimpsonsCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'The Simpsons Cast'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == _theSimpsonsCast ? 0 : _theSimpsonsCast.length,
          itemExtent: 300,
          itemBuilder: (context, index) {
            TheSimpsonsCast theSimpsonsCast = _theSimpsonsCast[index];
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
                                  child: Text(theSimpsonsCast.character.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.orangeAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(theSimpsonsCast.person.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(theSimpsonsCast
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
                                theSimpsonsCast.person.birthday.toString(),
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
                                theSimpsonsCast.character.image.original),
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
