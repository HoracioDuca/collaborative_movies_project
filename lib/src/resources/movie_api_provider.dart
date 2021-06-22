import 'dart:async';
import 'package:http/http.dart' show Client;
import '../utils/movie_strings.dart';
import 'dart:convert';
import '../models/movie.dart';

class MovieApiProvider {
  Client client = Client();

  Future<Movie> fetchAllMovies() async {
    final _response = await client.get(
      Uri.parse(
        MovieStrings.uriMainPath + MovieStrings.apiKey,
      ),
    );
    if (_response.statusCode == 200) {
      return Movie.fromJson(
        json.decode(
          _response.body,
        ),
      );
    } else {
      throw Exception(
        MovieStrings.showFetchError,
      );
    }
  }
}
