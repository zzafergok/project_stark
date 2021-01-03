import 'package:flutter/material.dart';
import 'package:project_stark/services/brooklyn_nine_nine_services.dart';
import 'package:project_stark/model/brooklyn_nine_nine_cast.dart';
import 'package:flip_card/flip_card.dart';

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
          itemExtent: 390,
          itemBuilder: (context, index) {
            BrooklynNineNineCast brooklynNineNineCast =
                _brooklynNineNineCast[index];
            return Container(
              color: Colors.blueGrey,
              child: Card(
                margin: EdgeInsets.all(20),
                color: Colors.amber,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  speed: 500,
                  flipOnTouch: true,
                  front: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            brooklynNineNineCast.character.image.original),
                      ),
                    ),
                  ),
                  back: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            brooklynNineNineCast.character.image.original),
                      ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
            );
          },
        ),
      ),
    );
  }
}
