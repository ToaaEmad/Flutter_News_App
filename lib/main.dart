import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/news_cubit.dart';
import 'package:news_app/screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsCubit(),
        child: NewsScreen(),
      ),
    );
  }
}
