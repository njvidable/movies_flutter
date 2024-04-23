import 'package:flutter/material.dart';
import 'package:movies/domain/model/movies.dart';
import 'package:movies/features/movie_details/detailed_movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          height: 300,
          width: 250,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 100, 98, 98),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  movie.getFullURL(), 
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    movie.title, 
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 12, 
                      fontWeight: FontWeight.bold
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedMovieView(movie: movie),
          ),
        );
      },
    );
  }
}