import 'package:http/http.dart' as http;
import 'package:project_stark/model/supernatural_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/19/cast";

  static Future<List<SupernaturalCast>> getSupernaturalCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<SupernaturalCast> supernaturalCast = supernaturalCastFromJson(response.body);
        return supernaturalCast;
      }else{
        return List<SupernaturalCast>();
      }
    }catch(e){
      return List<SupernaturalCast>();
    }
  }
}