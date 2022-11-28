import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ProveedorDatos extends ChangeNotifier{

  List<DataResponse> listDataResponse = [];

  ProveedorDatos(){
    this.cargarJson();
  }

  Future<List> jsonDeccode() async {

    var url="https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios";
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);

  }

  void cargarJson() async {

    List jsonData = await jsonDeccode();


    print(jsonData.toString());
    

  }

}



