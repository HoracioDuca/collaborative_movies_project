abstract class MovieStrings {
  static const String imagesPath = 'https://image.tmdb.org/t/p/w185';
  static const String uriMainPath =
      'https://api.themoviedb.org/3/movie/popular?api_key=';
  static const String apiKey = '6d2a1a187d53b2610d9d59d1c93d544c';
  static const String showFetchError = "Failed to show the Movie's list.";
  static const String filterMainPath =
      'https://api.themoviedb.org/3/search/movie?api_key=' + apiKey + '&query=';
  static const String hintText = 'Search movies here';
  static const String defaultImage =
      'https://www.lyon-ortho-clinic.com/files/cto_layout/img/placeholder/desktop_devices.jpg';
  static const String imageLogo = "assets/images/logo.png";
  static const String overview = "Overview";
  static const String noTitle = 'No title';
  static const String languageNotAssigned = 'N/A';
  static const String releaseDateNotFound = 'Unknown date';
  static const String noVotes = 'Not voted yet';
  static const String notVideoFound = 'Not video was found';
  static const String notOverviewFound = 'Not overview has been provided';
  static const String movieListException = 'The list of movies is empty';
}
