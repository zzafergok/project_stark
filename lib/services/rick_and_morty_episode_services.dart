import 'package:http/http.dart' as http;
import 'package:project_stark/model/rick_and_morty_episode.dart';

class Services {
  static const String url = "https://rickandmortyapi.com/api/episode";

  static Future<RickandMortyEpisode> getRickandMortyEpisode() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final RickandMortyEpisode rickandMortyEpisode =
            rickandMortyEpisodeFromJson(response.body);
        return rickandMortyEpisode;
      } else {
        return RickandMortyEpisode();
      }
    } catch (e) {
      return RickandMortyEpisode();
    }
  }
}
