import 'package:flutter/material.dart';
import 'package:project_stark/model/the_simpsons_cast.dart';
import 'package:project_stark/services/the_simpsons_services.dart';

class TheSimpsonsCastList extends StatefulWidget {
  @override
  _TheSimpsonsCastListState createState() => _TheSimpsonsCastListState();
}

class _TheSimpsonsCastListState extends State<TheSimpsonsCastList> {
  List<TheSimpsonsCast> _theSimpsonsCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

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
          itemBuilder: (context, index) {
            TheSimpsonsCast theSimpsonsCast = _theSimpsonsCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                theSimpsonsCast.character.name,
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
                          theSimpsonsCast.character.image.original),
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
                        Text("Seslendiren : "),
                        Text(theSimpsonsCast.person.name),
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
                        Text(theSimpsonsCast.person.birthday.toString()),
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
                        Text("Cinsiyeti : "),
                        Text(theSimpsonsCast.person.gender),
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
