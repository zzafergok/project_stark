import 'package:http/http.dart' as http;
import 'package:project_stark/model/game_of_thrones_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/82/cast";

  static Future<List<GameOfThronesCast>> getGameOfThronesCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<GameOfThronesCast> gameOfThronesCast = gameOfThronesCastFromJson(response.body);
        return gameOfThronesCast;
      }else{
        return List<GameOfThronesCast>();
      }
    }catch(e){
      return List<GameOfThronesCast>();
    }
  }
}