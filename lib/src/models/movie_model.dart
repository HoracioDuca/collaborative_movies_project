import 'result_movie_model.dart';

class MovieModel {
  late int _page;
  late int _totalResults;
  late int _totalPages;
  List<ResultMovie> _results = [];

  MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<ResultMovie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      ResultMovie result = ResultMovie(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<ResultMovie> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}
