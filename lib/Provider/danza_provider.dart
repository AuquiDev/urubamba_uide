
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urubamba_uide/Model/danza_models.dart';
import 'package:urubamba_uide/Model/recurso_model.dart';

class DanzaProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _api_key = 'd5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/danza';
  
  List<Danza> danzaList= [];

  DanzaProvider(){
    print('Danza Provider inicializado');
    getDanzaProvider();
  }

  getDanzaProvider() async{
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/danza
    var url = Uri.https(_baseUrl,'d5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/danza',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = DanzaResponsive.fromJson(response.body);
    // print(decodeData);
    danzaList = decodeData.danza;
    notifyListeners();
    // print(danzaList);
  }
  
}