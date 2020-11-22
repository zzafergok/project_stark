import 'package:http/http.dart' as http;
import 'package:project_stark/model/modern_family_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/80/cast";

  static Future<List<ModernFamilyCast>> getModernFamilyCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<ModernFamilyCast> modernFamilyCast = modernFamilyCastFromJson(response.body);
        return modernFamilyCast;
      }else{
        return List<ModernFamilyCast>();
      }
    }catch(e){
      return List<ModernFamilyCast>();
    }
  }
}