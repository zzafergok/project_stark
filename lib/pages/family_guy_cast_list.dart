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
            itemExtent: 300,
            itemBuilder: (context, index) {
              FamilyGuyCast familyGuyCast = _familyGuyCast[index];
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
                          margin:
                              EdgeInsets.only(right: 8, top: 50, bottom: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 20,
                                width: 150,
                                child: Center(
                                  child: Text(familyGuyCast.character.name),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.orangeAccent),
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
                                  familyGuyCast.character.image.medium),
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
            }),
      ),
    );
  }
}
