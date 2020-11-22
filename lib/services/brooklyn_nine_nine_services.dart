import 'package:http/http.dart' as http;
import 'package:project_stark/model/brooklyn_nine_nine_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/49/cast";

  static Future<List<BrooklynNineNineCast>> getBrooklynNineNineCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<BrooklynNineNineCast> brooklynNineNineCast = brooklynNineNineCastFromJson(response.body);
        return brooklynNineNineCast;
      }else{
        return List<BrooklynNineNineCast>();
      }
    }catch(e){
      return List<BrooklynNineNineCast>();
    }
  }
}