import 'dart:async';
import '../resources/movie_repository.dart';
import '../models/movie_model.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  StreamController<MovieModel> _streamMoviesController =
      StreamController<MovieModel>.broadcast();
  MovieRepository _movieRepository = MovieRepository();

  @override
  void dispose() {
    _streamMoviesController.close();
  }

  @override
  void initialize() {}

  @override
  void fetchMoviesApi() async {
    final _allMovies = await _movieRepository.fetchAllMovies();
    _streamMoviesController.sink.add(_allMovies);
  }

  @override
  Stream<MovieModel> get streamMovies => _streamMoviesController.stream;
}
