class EndPoints {
  static String baseUrl = "https://api.themoviedb.org/3";

  static const String movies = '/discover/movie?page=1';
  static String movieDetails(int movieId) => '/movie/$movieId';
  static String movieCast(int movieId) => '/movie/$movieId/credits';
  static String movieRecommendations(int movieId) => '/movie/$movieId/recommendations';
}