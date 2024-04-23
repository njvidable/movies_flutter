
part of 'home_bloc.dart';

class HomeState {
  const HomeState({
    this.popularMovies,
    this.bestMovies,
    this.comingMovies
  });

  final MovieResult1Model ? popularMovies;
  final MovieResult1Model ? bestMovies;
  final MovieResult2Model ? comingMovies;

  HomeState copyWith({
    final int? index,
    final String? pageName,
    MovieResult1Model? popularMovies,
    MovieResult1Model? bestMovies,
    MovieResult2Model? comingMovies,
  }) {
    return HomeState(
      popularMovies: popularMovies ?? this.popularMovies,
      bestMovies: bestMovies ?? this.bestMovies,
      comingMovies: comingMovies ?? this.comingMovies
    );
  }

  factory HomeState.initial() => const HomeState(
        //filed: initial value,
  );
}
