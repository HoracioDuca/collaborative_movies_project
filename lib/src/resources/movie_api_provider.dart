import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:movies_bloc/src/styles/string_cons.dart';
import 'dart:convert';
import '../models/movie_model.dart';

class MovieApiProvider {
  Client client = Client();

  Future<MovieModel> fetchAllMovies() async {
    final _response = await client.get(
      Uri.parse(
        StringConstant.uriMainPath + StringConstant.apiKey,
      ),
    );
    if (_response.statusCode == 200) {
      return MovieModel.fromJson(
        json.decode(
          _response.body,
        ),
      );
    } else {
      throw Exception(
        StringConstant.showFetchError,
      );
    }
  }
}
