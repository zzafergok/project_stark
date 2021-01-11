import 'package:flutter/material.dart';
import 'package:project_stark/model/family_guy_cast.dart';
import 'package:project_stark/services/family_guy_services.dart';

class FamilyGuyCastList extends StatefulWidget {
  @override
  _FamilyGuyCastListState createState() => _FamilyGuyCastListState();
}

class _FamilyGuyCastListState extends State<FamilyGuyCastList> {
  List<FamilyGuyCast> _familyGuyCast;
  bool _loading;
  Color bg = const Color(0xFF7DAA92);

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getFamilyGuyCast().then((familyGuyCast) {
      setState(() {
        _familyGuyCast = familyGuyCast;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading...' : 'Family Guy Cast'),
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: null == _familyGuyCast ? 0 : _familyGuyCast.length,
          itemBuilder: (context, index) {
            FamilyGuyCast familyGuyCast = _familyGuyCast[index];
            return ExpansionTile(
              title: Text(
                familyGuyCast.character.name,
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: bg,
              children: [
                Container(
                  height: 300,
                  padding: EdgeInsets.all(175),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(familyGuyCast.character.image.medium),
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
                        Text(familyGuyCast.person.name),
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
                        Text(familyGuyCast.person.birthday.toString()),
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
                        Text(familyGuyCast.person.gender),
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
