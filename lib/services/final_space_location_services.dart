import 'package:http/http.dart' as http;
import 'package:project_stark/model/final_space_location.dart';

class Services {
  static const String url = "https://finalspaceapi.com/api/v0/location";

  static Future<List<FinalSpaceLocation>> getFinalSpaceEpisode() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<FinalSpaceLocation> finalSpaceLocation =
        finalSpaceLocationFromJson(response.body);
        return finalSpaceLocation;
      } else {
        return List<FinalSpaceLocation>();
      }
    } catch (e) {
      return List<FinalSpaceLocation>();
    }
  }
}
