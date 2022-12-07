
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urubamba_uide/Model/recurso_model.dart';

class RecursosProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _api_key = 'd5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/recursos';
  
  List<Recurso> recursoList= [];
  RecursosProvider(){
    print('Recursos Provider inicializado');
    getRecursosProvider();
  }

  getRecursosProvider() async{
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/recursos
    var url = Uri.https(_baseUrl,'d5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/recursos',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = RecursoResponsive.fromJson(response.body);
    // print(decodeData.recursos);
    recursoList = decodeData.recursos;
    notifyListeners();

  }
  
}