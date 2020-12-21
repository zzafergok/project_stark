import 'package:flutter/material.dart';
import 'package:project_stark/model/modern_family_cast.dart';
import 'package:project_stark/services/modern_family_services.dart';

class ModernFamilyCastList extends StatefulWidget {
  @override
  _ModernFamilyCastListState createState() => _ModernFamilyCastListState();
}

class _ModernFamilyCastListState extends State<ModernFamilyCastList> {
  //
  List<ModernFamilyCast> _modernFamilyCast;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getModernFamilyCast().then((modernFamilyCast) {
      setState(() {
        _modernFamilyCast = modernFamilyCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Modern Family Cast'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == _modernFamilyCast ? 0 : _modernFamilyCast.length,
          itemExtent: 300,
          itemBuilder: (context, index) {
            ModernFamilyCast modernFamilyCast = _modernFamilyCast[index];
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
                                  child: Text(modernFamilyCast.character.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.orangeAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(modernFamilyCast.person.name)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.tealAccent),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              child: Center(
                                  child: Text(modernFamilyCast
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
                                modernFamilyCast.person.birthday.toString(),
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
                                modernFamilyCast.character.image.original),
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
