import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DataproviderScreen extends ChangeNotifier {

  Future<List<DataResponse>> getDataFromGoogleSheet() async {
  Response data = await http.get(
    Uri.parse(
        "https://script.google.com/macros/s/AKfycbwG-W8x3ojt3-h5F-2IsmfdfTTdGo-bJiYF9gtBfC80KWNc7Qfv3DlApShRwYanHZia4A/exec"),
    );
    dynamic jsonAppData = convert.jsonDecode(data.body);
  final List<DataResponse> dataBase = [];
  for (dynamic data in jsonAppData) {
    DataResponse dataResponse = DataResponse(
      usuario: data['ususario'],
      clave: data['clave']
    );
    dataBase.add(dataResponse);
  }
  return dataBase;
  }
}