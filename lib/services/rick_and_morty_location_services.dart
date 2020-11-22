import 'package:http/http.dart' as http;
import 'package:project_stark/model/rick_and_morty_location.dart';

class Services {
  static const String url = "https://rickandmortyapi.com/api/location";

  static Future<RickandMortyLocation> getRickandMortyLocation() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final RickandMortyLocation rickandMortyLocation =
            rickandMortyLocationFromJson(response.body);
        return rickandMortyLocation;
      } else {
        return RickandMortyLocation();
      }
    } catch (e) {
      return RickandMortyLocation();
    }
  }
}
