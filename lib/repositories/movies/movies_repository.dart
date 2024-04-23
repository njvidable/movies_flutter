import 'package:movies/domain/model/movies_result1.dart';
import 'package:movies/domain/model/movies_result2.dart';

abstract class MoviesRepository {
  Future<MovieResult1Model?> getPopularMovies();

  Future<MovieResult1Model?> getBestMovies();

  Future<MovieResult2Model?> getComingMovies();
}