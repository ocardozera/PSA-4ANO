import 'package:flutter/material.dart';
import 'package:revisao_interface/view/calculadora.dart';
import 'package:revisao_interface/view/calcular_idade.dart';
import 'package:revisao_interface/view/hello_world.dart';

import 'menu.dart';
import 'my_home_page.dart';

//arquivo de configuracao

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeira Aula - 29/06',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Menu(),
        '/contador': (context) => MyHomePage(),
        '/helloworld': (context) => HelloWorld(),
        '/calcularIdade': (context) => CalcularIdade(),
        '/calculadora': (context) => Calculadora(),
      },
    );
  }
}
