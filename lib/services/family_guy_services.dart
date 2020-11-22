import 'package:http/http.dart' as http;
import 'package:project_stark/model/family_guy_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/84/cast";

  static Future<List<FamilyGuyCast>> getFamilyGuyCast() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<FamilyGuyCast> familyGuyCast = familyGuyCastFromJson(response.body);
        return familyGuyCast;
      }else{
        return List<FamilyGuyCast>();
      }
    }catch(e){
      return List<FamilyGuyCast>();
    }
  }
}