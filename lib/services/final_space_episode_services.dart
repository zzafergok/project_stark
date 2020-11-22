import 'package:http/http.dart' as http;
import 'package:project_stark/model/final_space_episode.dart';

class Services {
  static const String url = "https://finalspaceapi.com/api/v0/episode";

  static Future<List<FinalSpaceEpisode>> getFinalSpaceEpisode() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<FinalSpaceEpisode> finalSpaceEpisode =
            finalSpaceEpisodeFromJson(response.body);
        return finalSpaceEpisode;
      } else {
        return List<FinalSpaceEpisode>();
      }
    } catch (e) {
      return List<FinalSpaceEpisode>();
    }
  }
}
