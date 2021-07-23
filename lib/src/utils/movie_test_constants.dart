import 'package:movies_bloc/src/models/result_movie.dart';

abstract class MovieTestConstants {
  static const String moviesBlocGroupDescription = 'BLoC testing';
  static const String moviesBlocTestDescription =
      'Movies BLoC testing fetchAllMovies';
  static const String movieApiProviderGroupDescription =
      'The fetch of movies from API';
  static const String movieApiProviderGetMovies = 'get AllMovies';
  static const String movieApiProviderGetFilter = 'get MoviesByFilter';
  static const String movieApiProviderDefaultSearch = 'rocky';
  static const String homePageTestWidgetsDescription =
      'Testing if HomePage shows up';
  static const String homePageTestTitle = 'The Movies App';
  static const String movieDetailTestWidgetsDescription =
      'Testing the movie details page';
  static const String defaultStringText = 'Beautiful string';
  static const String movieSearchBarTestWidgetDescription = 'Testing search bar';
  static const int defaultIntValue = 1;
  static const double defaultDoubleValue = 1.2;
  static const List<int> defaultIntArrayValue = [];
  static const List<ResultMovie> defaultResultMovieArrayValue = [];
}
