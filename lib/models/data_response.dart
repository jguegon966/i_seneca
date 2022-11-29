// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromMap(jsonString);

import 'dart:convert';

class UserList {
  final List<User> userList;

  UserList({
    required this.userList,
  });

  factory UserList.fromJson(List<dynamic> parsedJson) {

    List<User> listaResponse = <User>[];
    listaResponse = parsedJson.map((i)=>User.fromJson(i)).toList();

    return UserList(
       userList: listaResponse,
    );
  }

}

class User {
    User({
        this.id,
        required this.usuario,
        required this.clave,
    });

    String? id;
    String usuario;
    String clave;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
    );

}
