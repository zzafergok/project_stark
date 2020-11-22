import 'package:http/http.dart' as http;
import 'package:project_stark/model/rick_and_morty_character.dart';

class Services {
  static const String url = "https://rickandmortyapi.com/api/character";

  static Future<RickandMortyCharacter> getRickandMortyCharacter() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final RickandMortyCharacter rickandMortyCharacter =
            rickandMortyCharacterFromJson(response.body);
        return rickandMortyCharacter;
      } else {
        return RickandMortyCharacter();
      }
    } catch (e) {
      return RickandMortyCharacter();
    }
  }
}
