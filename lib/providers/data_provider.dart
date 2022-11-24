import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DataproviderScreen extends ChangeNotifier {

  List<String> dataBase = [];

  Future<String> fetchData(http.Client client) async {
    final response = await client.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios'));

    return response.body;
  }

  List<DataResponse> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<DataResponse>((json) => DataResponse.fromJson(json))
        .toList();
  }

  Future<String> _getJsonData() async {

    var url = Uri.https('https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios');
    final response = await http.get(url);
    return response.body;

  }

  getDatas() async {
    final jsonData = await _getJsonData();
    final dataResponse = DataResponse.fromJson(jsonData);

    dataBase = dataResponse as List<String>;

  }
}
