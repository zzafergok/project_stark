import 'package:http/http.dart' as http;
import 'package:project_stark/model/final_space_character.dart';

class Services {
  static const String url = "https://finalspaceapi.com/api/v0/character";

  static Future<List<FinalSpaceCharacter>> getFinalSpaceCharacter() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<FinalSpaceCharacter> finalSpaceCharacter =
            finalSpaceCharacterFromJson(response.body);
        return finalSpaceCharacter;
      } else {
        return List<FinalSpaceCharacter>();
      }
    } catch (e) {
      return List<FinalSpaceCharacter>();
    }
  }
}
