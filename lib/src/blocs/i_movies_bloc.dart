import '../models/movie.dart';
import 'contract/i_bloc.dart';

abstract class IMoviesBloc extends IBloc {
  Stream<Movie> get streamMovies;

  void fetchMoviesApi();
}
