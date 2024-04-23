

import 'package:flutter/material.dart';
import 'package:movies/domain/model/movies.dart';

class DetailedMovieView extends StatelessWidget {

  const DetailedMovieView({
    super.key,
    required this.movie
  });

  final MovieModel movie;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 43, 43, 41),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
              const SizedBox(height: 30,),
              Center(
                child: Text(
                  movie.title, 
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 15,),
              Image.network(movie.getFullURL()),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 100, 98, 98),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, spreadRadius: 3),
                  ],
                ),
                child: Text(
                  movie.description, 
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 24, 40, 189)),
                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 62, 62, 63)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)), side: BorderSide(color: Color.fromARGB(255, 43, 46, 223))))),
                  child: const Text(
                    'PLAY',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

}