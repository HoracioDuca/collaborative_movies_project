import '../models/movie_model.dart';
import 'contract/i_bloc.dart';

abstract class IMoviesBloc extends IBloc {
  Stream<MovieModel> get streamMovies;

  void fetchMoviesApi();
}
