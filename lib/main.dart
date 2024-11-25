import 'package:flutter/material.dart';
import 'home_page.dart';
import 'home_page2.dart';


void main(){
  runApp(MaterialApp(
    initialRoute: '/homepage',
    debugShowCheckedModeBanner: false,
    routes: {
      '/homepage': (context) => const SortearPalavra(),
      '/dica': (context) => const MostrarDica(),

    }

  ));
}