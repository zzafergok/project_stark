import 'package:flutter/material.dart';
import 'package:project_stark/model/modern_family_cast.dart';
import 'package:project_stark/services/modern_family_services.dart';

class ModernFamilyCastList extends StatefulWidget {
  @override
  _ModernFamilyCastListState createState() => _ModernFamilyCastListState();
}

class _ModernFamilyCastListState extends State<ModernFamilyCastList> {
  List<ModernFamilyCast> _modernFamilyCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

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
          itemBuilder: (context, index) {
            ModernFamilyCast modernFamilyCast = _modernFamilyCast[index];
            return ExpansionTile(
              backgroundColor: bg,
              title: Text(
                modernFamilyCast.character.name,
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
                          modernFamilyCast.character.image.original),
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
                        Text(modernFamilyCast.person.name),
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
                        Text(modernFamilyCast.person.birthday.toString()),
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
                        Text(modernFamilyCast.person.country.code +
                            " / " +
                            modernFamilyCast.person.country.name),
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
