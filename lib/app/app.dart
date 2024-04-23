import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/bloc/home_bloc.dart';
import 'package:movies/features/home/home_screem.dart';
import 'package:movies/infrastructure/resources/movies_resource.dart';
import 'package:movies/repositories/movies/movies_repository_impl.dart';
import 'package:flutter/gestures.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            moviesRepository: MoviesRepositoryImpl(
              movieResource: MovieResource()
            )
          )
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        home: const HomeScreen(),
      ),
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}