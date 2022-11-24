// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromMap(jsonString);

import 'dart:convert';

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
