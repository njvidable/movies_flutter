
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/custom_widgets/movie_list_or_progress.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchPopularMovies());
    context.read<HomeBloc>().add(FetchBestMovies());
    context.read<HomeBloc>().add(FetchComingMovies());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:  Color.fromARGB(255, 34, 32, 32)
        ),
        backgroundColor: const Color.fromARGB(255, 100, 98, 98),
        title: const Center(child: Text('MOVIES', style: TextStyle(color: Colors.white),)),
      ),
      backgroundColor: const  Color.fromARGB(255, 43, 43, 41),
      body: Column(
        children: [
          const Center(child: Text('Más populares', style: TextStyle(color: Colors.white, fontSize: 20)),),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return ListOrProgressView(movieList: state.popularMovies?.results,);
          },),
          const SizedBox(height: 5,),
          const Center(
            child: Text('Mejores calificadas', style: TextStyle(color: Colors.white, fontSize: 20)),),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return ListOrProgressView(movieList: state.bestMovies?.results,);
          },),
          const SizedBox(height: 5,),
          const Center(child: Text('Próximos estrenos!', style: TextStyle(color: Colors.white, fontSize: 20),),),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return ListOrProgressView(movieList: state.comingMovies?.results,);
          },),
        ],
      )
    );
  }
}