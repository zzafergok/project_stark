import 'package:flutter/material.dart';
import 'package:project_stark/pages/brooklyn_nine_nine_cast_list.dart';
import 'package:project_stark/pages/family_guy_cast_list.dart';
import 'package:project_stark/pages/final_space_list.dart';
import 'package:project_stark/pages/game_of_thrones_cast_list.dart';
import 'package:project_stark/pages/modern_family_cast_list.dart';
import 'package:project_stark/pages/rick_and_morty_list.dart';
import 'package:project_stark/pages/supernatural_cast_list.dart';
import 'package:project_stark/pages/the_big_bang_theory_cast_list.dart';
import 'package:project_stark/pages/the_simpsons_cast_list.dart';
import 'pages/pokemon_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Stark',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Menu"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokemonList()));
                    },
                    child: Container(
                        height: 275,
                        width: 316,
                        margin: EdgeInsets.only(top: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://compote.slate.com/images/18ba92e4-e39b-44a3-af3b-88f735703fa7.png?width=780&height=520&rect=1560x1040&offset=0x0"),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("Pokemon"),
                              backgroundColor: Colors.amberAccent,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalSpaceCastList()));
                    },
                    child: Container(
                        height: 275,
                        width: 316,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 45),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPwnWCx7yYJFgU8BIfXzpkgV3NwwIWuwGC9w&usqp=CAU", scale: 0.9),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Final Space",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.black45,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RickAndMortyCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZB6ELN-_hxUSoDL6ke9xgcJpb5PmNw65_Rg&usqp=CAU"), scale: 0.95,
                                )),
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Rick and Morty",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.purpleAccent,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BrooklynNineNineCastList()));
                    },
                    child: Container(
                        height: 230,
                        width: 316,
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0HWYsi4GitQVALi7hE5JOKUYsbCpGuBBjbw&usqp=CAU"),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("Brooklyn Nine Nine"),
                              backgroundColor: Colors.amberAccent,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FamilyGuyCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLfuLJQ7DIZAOHyF_WYVtj3ke-sx7TQwHQHw&usqp=CAU",scale: 0.9),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("Family Guy"),
                              backgroundColor: Colors.orange,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameOfThronesCastList()));
                    },
                    child: Container(
                        //color: Colors.grey,
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvriuYh0t7piD671xrgKtH954CTZMbuTWZ4A&usqp=CAU",
                                      scale: 0.9),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("Game of Thrones"),
                              backgroundColor: Colors.black26,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModernFamilyCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf4jSrvrGVs3ZANoaSYumE_BCRF2aehYXDYA&usqp=CAU",
                                      scale: 0.9),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Modern Family",
                                style: TextStyle(color: Colors.white70),
                              ),
                              backgroundColor: Colors.blueGrey,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupernaturalCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo-eQrmv0uN2mRdI2HHmUpPKb_ST8T1eizrw&usqp=CAU",
                                      scale: 0.95),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text(
                                "Supernatural",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.black54,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TheBigBangTheoryCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnMznyP1NgjxPEPALPLAgj-_CuOvZXGfGoCQ&usqp=CAU",
                                      scale: 0.95),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("The Big Bang Theory"),
                              backgroundColor: Colors.orange,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
                Card(
                  //color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TheSimpsonsCastList()));
                    },
                    child: Container(
                        height: 225,
                        width: 316,
                        margin: EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqUCzXwCT9G1kvEw-C-TUemRidOPrJ0n7Z8A&usqp=CAU",
                                      scale: 0.8),
                                )),
                              ),
                            ),
                            Chip(
                              label: Text("The Simpsons"),
                              backgroundColor: Colors.amberAccent,
                            )
                          ],
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 6,
                  margin: EdgeInsets.all(16),
                ),
              ],
            ),
          ),
        ));
  }
}
