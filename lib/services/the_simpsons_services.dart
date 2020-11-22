import 'package:http/http.dart' as http;
import 'package:project_stark/model/the_simpsons_cast.dart';

class Services {
  static const String url = "https://api.tvmaze.com/shows/83/cast";

  static Future<List<TheSimpsonsCast>> getTheSimpsonsCast() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<TheSimpsonsCast> theSimpsonsCast = theSimpsonsCastFromJson(
            response.body);
        return theSimpsonsCast;
      } else {
        return List<TheSimpsonsCast>();
      }
    } catch (e) {
      return List<TheSimpsonsCast>();
    }
  }
}
