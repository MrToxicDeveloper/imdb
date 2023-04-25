import 'package:flutter/material.dart';
import 'package:imdb/home/provider/home_provider.dart';
import 'package:imdb/home/view/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(),
        },
      ),
    ),
  );
}
