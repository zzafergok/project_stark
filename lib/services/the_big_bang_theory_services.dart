import 'package:http/http.dart' as http;
import 'package:project_stark/model/the_big_bang_theory_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/66/cast";

  static Future<List<TheBigBangTheoryCast>> getTheBigBangTheoryCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<TheBigBangTheoryCast> theBigBangTheoryCast = theBigBangTheoryCastFromJson(response.body);
        return theBigBangTheoryCast;
      }else{
        return List<TheBigBangTheoryCast>();
      }
    }catch(e){
      return List<TheBigBangTheoryCast>();
    }
  }
}