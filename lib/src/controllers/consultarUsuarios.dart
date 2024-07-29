import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
// import 'package:http/http.dart%20';

Future<List<Usuarios>> consultarusuarios1() async {
  final response = await http.get(Uri.parse(''));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Usuarios.fromJson(json)).toList();
  } else {
    throw Exception('Failes to load album');
  }
}

class Usuarios {
  final String name;
  final String email;

  const Usuarios({
    required this.name,
    required this.email,
  });
  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      name: json['name'],
      email: json['email'],
    );
  }
}
