import 'package:movies/domain/model/movies_result1.dart';
import 'package:movies/domain/model/movies_result2.dart';
import 'package:movies/infrastructure/resources/movies_resource.dart';
import 'package:movies/repositories/movies/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MovieResource movieResource;

  MoviesRepositoryImpl({required this.movieResource});

  @override
  Future<MovieResult1Model?> getPopularMovies() {
    return movieResource.getPopularMovies();
  }

  @override
  Future<MovieResult1Model?> getBestMovies() {
    return movieResource.getBestMovies();
  }

  @override
  Future<MovieResult2Model?> getComingMovies() {
    return movieResource.getComingMovies();
  }

}
