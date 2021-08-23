import 'package:flutter/material.dart';
import 'package:peliculas_2021/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_2021/providers/movies_provider.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: ( _ )=> MoviesProvider())
      ],
      child: MyApp(),
      );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':    (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
     theme: ThemeData.light().copyWith(
       appBarTheme: AppBarTheme(
         color: Color(0xff14274E),
         centerTitle: true,
         titleSpacing: 1,
       )
     ),
    );
  }
}