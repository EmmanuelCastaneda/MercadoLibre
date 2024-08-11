  // import 'dart:convert';
  // import 'package:http/http.dart' as http;

  // Future<Users>createUsers(String name, String email, String password)async{
  //   final response =await http.get()
  // }
  // import 'dart:convert';
  // import 'package:http/http.dart' as http;

  // class Users {
  //   final String id;
  //   final String name;
  //   final String email;

  //   Users({
  //     required this.id, // 'id' debe estar presente en el constructor para ser inicializado
  //     required this.name,
  //     required this.email,
  //   });

  //   factory Users.fromJson(Map<String, dynamic> json) {
  //     return Users(
  //       id: json['_id'], // Aquí 'id' se inicializa con el valor del campo '_id' del JSON
  //       name: json['nombre'], // Asegúrate de que coincida con el nombre del campo en la respuesta de la API
  //       email: json['correo'], // Ejemplo de otro campo
  //     );
  //   }

  //   // Método estático para manejar el caso de un usuario vacío
  //   factory Users.empty() {
  //     return Users(
  //       id: '', // Puedes establecerlo como un valor vacío o null según tus necesidades
  //       name: '',
  //       email: '',
  //     );
  //   }

  //   // Método getter para obtener el 'id'
  //   String get getId => id; // Si prefieres, puedes llamar al getter 'getId' en lugar de solo 'id'
  // }

  // Future<List<Users>> consultUsers() async {
  //   final response = await http.get(
  //     Uri.parse('https://nodejs-api-1-iji8.onrender.com/api/user'),
  //   );

  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonList = jsonDecode(response.body);
  //     List<Users> usersList = jsonList.map((json) => Users.fromJson(json)).toList();
  //     return usersList;
  //   } else {
  //     throw Exception('Failed to load users');
  //   }
  // }

  // Future<Users> createUsers(String name, String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('https://nodejs-api-1-iji8.onrender.com/api/user'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "name": name,
  //       "email": email,
  //       "password": password,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //   } else {
  //     throw Exception('Failed to register user');
  //   }
  // }

  // Future<Users> deleteUsers(String id) async {
  //   final http.Response response = await http.delete(
  //     Uri.parse('https://nodejs-api-1-iji8.onrender.com/api/user/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return Users.empty();
  //   } else {
  //     throw Exception('Failed to delete user');
  //   }
  // }
  import 'package:http/http.dart' as http;
  import 'dart:convert';

  // import 'package:mercado_libre/src/controllers/consultarUsuarios.dart';

  // Future<List<Map<String, dynamic>>> consultarUsuarios() async {
  //   final response = await http.get(
  //       Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users'));
  //   if (response.statusCode == 200) {
  //     return List<Map<String, dynamic>>.from(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Error ${response.statusCode}: ${response.reasonPhrase}');
  //   }
  // }
  Future<List<Users>> consultarUsuarios() async {
  final response = await http.get(
      Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    List<Users> usersList = jsonList.map((json) => Users.fromJson(json)).toList();
    return usersList;
  } else {
    throw Exception('Error ${response.statusCode}: ${response.reasonPhrase}');
  }
}

  Future<Users> createUsers(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"name": name, "email": email, "password": password}),
    );
    if (response.statusCode == 201) {
      return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('No es posible registrarse');
    }
  }

  Future<Users> deleteUsers(String id) async {
    final response = await http.delete(
      Uri.parse('https://apirestnodeexpressmongodb.onrender.com/api/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Users.empty();
    } else {
      throw Exception('Failed to delete user.'); // Corregido a "user"
    }
  }

  Future<Users> updateUsers(
      String id, String name, String email, String password) async {
    try {
      final response = await http.put(
          Uri.parse(
              'https://api-nodejs-mongodb-2j7b.onrender.com/api/usuario/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'password': password,
          }));
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception(
            'No ha sido posible actualizar al usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al actualizar al usuario: $e');
    }
  }

  class Users {
    final String _id;
    final String name;
    final String email;
    final String password;

    // Constructor nombrado
    const Users({
      required String id,
      required this.name,
      required this.email,
      required this.password,
    }) : _id = id;

    Users.empty()
        : _id = '',
          name = '',
          email = '',
          password = '';

    factory Users.fromJson(Map<String, dynamic> json) {
      return Users(
        id: json['_id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
      );
    }

    String get id => _id;
  }
