import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movies/domain/model/movies_result1.dart';
import 'package:movies/domain/model/movies_result2.dart';
import 'package:movies/repositories/movies/movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesRepository moviesRepository;

  HomeBloc({required this.moviesRepository}) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {});
    on<FetchPopularMovies>(_onFetchPopularMovies);
    on<FetchBestMovies>(_onFetchBestMovies);
    on<FetchComingMovies>(_onFetchComingMovies);
  }

  FutureOr<void> _onFetchPopularMovies(event, emit) async {
    final response = await moviesRepository.getPopularMovies();
    if (response != null) {
      emit(state.copyWith(
        popularMovies: response,
      ));
    }
  }

  FutureOr<void> _onFetchBestMovies(event, emit) async {
    final response = await moviesRepository.getBestMovies();
    if (response != null) {
      emit(state.copyWith(
        bestMovies: response,
      ));
    }
  }

  FutureOr<void> _onFetchComingMovies(event, emit) async {
    final response = await moviesRepository.getComingMovies();
    if (response != null) {
      emit(state.copyWith(
        comingMovies: response,
      ));
    }
  }
}
