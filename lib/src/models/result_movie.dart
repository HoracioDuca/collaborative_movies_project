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
      video: parsedJson['video'],
      voteAverage: parsedJson['vote_average'],
      title: parsedJson['title'],
      popularity: parsedJson['popularity'],
      posterPath: parsedJson['poster_path'] != null
          ? MovieStrings.imagesPath + parsedJson['poster_path']
          : MovieStrings.defaultImage,
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      genreIDs: _getListOfGenresId(getGenresIds),
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'],
      overview: parsedJson['overview'],
      releaseDate: parsedJson['release_date'],
    );
  }
}
