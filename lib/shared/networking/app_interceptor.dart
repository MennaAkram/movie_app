import 'package:dio/dio.dart';
import 'package:movie_app/app/di.dart';

class AppInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMWU4NGJlOTkyYzA1MzZhM2VlZmNlZjcxZGY5NDBmNSIsIm5iZiI6MTcyMzc1MjI5OC45NTQyNDQsInN1YiI6IjY2YmU1YTkyNWE5ZGRkNGU2OTU1OGVkNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.42V2KXbhxkFIGSpVKsZQYXwZ2QUh2HN3WQi3Nm9v4y4";
    options.queryParameters["api_key"] = "11e84be992c0536a3eefcef71df940f5";
    handler.next(options);
  }

}