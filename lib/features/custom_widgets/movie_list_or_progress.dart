import 'package:flutter/material.dart';
import 'package:movies/domain/model/movie_result.dart';
import 'package:movies/domain/model/movies.dart';
import 'package:movies/features/custom_widgets/movie_card.dart';

class ListOrProgressView extends StatelessWidget {
  const ListOrProgressView({
    super.key,
    required this.movieList
  });

  final List<Result>? movieList;

  @override
  Widget build(BuildContext context) {
    if(movieList == null) {
      return const Expanded(
        child: UnconstrainedBox(
          child: CircularProgressIndicator(color: Color.fromARGB(255, 245, 242, 242),)
        )
      );
    }
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        //shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: movieList!.length,
        itemBuilder: (context, index) {
          final curr = movieList![index];
          return MovieCard(movie: MovieModel( 
            id: curr.id, 
            title: curr.title, 
            description: curr.overview,
            imageURL: curr.posterPath
          ));
        }
      ),
    );
  }
}