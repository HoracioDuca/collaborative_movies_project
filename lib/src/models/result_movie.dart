import '../utils/movie_strings.dart';

class ResultMovie {
  int? voteCount;
  late int id;
  bool? video;
  var voteAverage;
  late String title;
  late double popularity;
  late String posterPath;
  late String originalLanguage;
  late String originalTitle;
  late List<int> genreIDs;
  String? backdropPath;
  late bool adult;
  late String overview;
  String? releaseDate;

  ResultMovie({
    this.voteCount,
    required this.id,
    this.video,
    this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIDs,
    this.backdropPath,
    required this.adult,
    required this.overview,
    this.releaseDate,
  });

  factory ResultMovie.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    var getGenresIds = parsedJson['genre_ids'] as List;

    List<int> _getListOfGenresId(
      List<dynamic> parsedList,
    ) {
      List<int> _genreIDs = [];

      for (int genreId = 0; genreId < parsedList.length; genreId++) {
        _genreIDs.add(
          parsedList[genreId],
        );
      }
      return _genreIDs;
    }

    return ResultMovie(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: parsedJson['video'] != null
          ? parsedJson['video']
          : 'Not video was found',
      voteAverage: parsedJson['vote_average'] != null
          ? parsedJson['vote_average']
          : 'Not voted yet',
      title: parsedJson['title'] != null ? parsedJson['title'] : 'No title',
      popularity: parsedJson['popularity'],
      posterPath: parsedJson['poster_path'] != null
          ? MovieStrings.imagesPath + parsedJson['poster_path']
          : MovieStrings.defaultImage,
      originalLanguage: parsedJson['original_language'] != null
          ? parsedJson['original_language']
          : 'N/A',
      originalTitle: parsedJson['original_title'] != null
          ? parsedJson['title']
          : 'No title',
      genreIDs: _getListOfGenresId(getGenresIds),
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'],
      overview: parsedJson['overview'] != null
          ? parsedJson['overview']
          : 'Not overview has been provided',
      releaseDate: parsedJson['release_date'] != null
          ? parsedJson['release_date']
          : 'Unknown date',
    );
  }
}
