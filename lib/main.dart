
import 'package:google_fonts/google_fonts.dart';
import 'package:urubamba_uide/Provider/danza_provider.dart';
import 'package:urubamba_uide/screens/drawer.dart';
import 'package:urubamba_uide/Pages/home_page.dart';
import 'package:urubamba_uide/Pages/muni_page.dart';

import 'package:urubamba_uide/Provider/distrito_provider.dart';
import 'package:urubamba_uide/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp( AppState());//cambio .....

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return DistritoProvider();
          }
          ),
         ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return RecursosProvider();
          }
          ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return DanzaProvider();
          }),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urubamba guia',
      // initialRoute: 'home',
      // routes: {
      //   'home':(context) => HomePage(),
      //   //'details':(context) => const tTweenAnimationBuilder(productos: [],)
      // },
      home: HomePage(),//Draweer(),//MunicipalidadPage(),//cambio .....
      theme:ThemeData(
       
        textTheme: GoogleFonts.firaSansExtraCondensedTextTheme()
      ) ,     
    );
  }
}