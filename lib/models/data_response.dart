// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromMap(jsonString);

import 'dart:convert';

class DataResponseList {
  final List<DataResponse> dataResponseList;

  DataResponseList({
    required this.dataResponseList,
  });

  factory DataResponseList.fromJson(List<dynamic> parsedJson) {

    List<DataResponse> listaResponse = <DataResponse>[];
    listaResponse = parsedJson.map((i)=>DataResponse.fromJson(i)).toList();

    return DataResponseList(
       dataResponseList: listaResponse,
    );
  }

}

class DataResponse {
    DataResponse({
        this.id,
        required this.usuario,
        required this.clave,
    });

    String? id;
    String usuario;
    String clave;

    factory DataResponse.fromJson(String str) => DataResponse.fromMap(json.decode(str));

    factory DataResponse.fromMap(Map<String, dynamic> json) => DataResponse(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
    );

}
