import 'dart:convert';
import 'package:http/http.dart' as http;

class TmdbService {
  // 🔴 REPLACE WITH YOUR REAL API KEY
  static const String _apiKey = 'b2efe2e5dca1ca68351923135d178368';

  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  /// 🎞 Image helper
  static String imageUrl(String path) {
    return '$_imageBaseUrl$path';
  }

  /// 🔥 Trending movies (Hero banner)
  static Future<List<dynamic>> fetchTrending() async {
    final url =
        '$_baseUrl/trending/movie/week?api_key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load trending movies');
    }

    final data = json.decode(response.body);
    return data['results'];
  }

  /// 🎬 Movies by genre
  static Future<List<dynamic>> fetchByGenre(int genreId) async {
    final url =
        '$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genreId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load genre movies');
    }

    final data = json.decode(response.body);
    return data['results'];
  }
}
