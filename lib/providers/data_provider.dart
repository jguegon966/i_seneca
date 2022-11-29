import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ProveedorDatos extends ChangeNotifier{

  Future<List<User>> getDataFromGoogleSheet() async {

    Response data = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios'));
    dynamic jsonAppData = convert.jsonDecode(data.body);
    final List<User> listaUsuarios =[];
    for(dynamic data in jsonAppData){

      User user = User(
        usuario: data['usuario'], 
        clave: data['clave']
      );
      listaUsuarios.add(user);
    }

    return listaUsuarios;

  }
  
}



