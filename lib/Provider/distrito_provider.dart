//proveedor de informacion 


import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:urubamba_uide/Model/distrito_models.dart';

class DistritoProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _apiKey = '39c80a5da3431bc5057fcf0e0a8a22b6/distritosDeLaProvinciaDeUrubamba/distritos';

List<Distrito> distritoList = [];

 DistritoProvider(){
   print('distrito provider inicalizado');
   getDistritoprovider();
   
 }

 //otro metodo para ver los datos mapeados
 getDistritoprovider()async {
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/distritos
  var url = Uri.https(_baseUrl,'39c80a5da3431bc5057fcf0e0a8a22b6/distritosDeLaProvinciaDeUrubamba/distritos',{
    'api_key': _apiKey
  });
  
  final response = await http.get(url);
  //decodificar la informacion y convertirlo a un Mapa
  final decodeData =  DistritoResponsive.fromJson(response.body);
  print(decodeData.distritos[0].descripcion); 
  distritoList = decodeData.distritos;
  print(distritoList);
  notifyListeners();
 }
}

 