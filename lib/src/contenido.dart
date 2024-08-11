import 'package:flutter/material.dart';
import 'package:mercado_libre/src/screens/menu_principal_01.dart';
import 'package:mercado_libre/src/screens/inicio_de_sesion.dart';
import 'package:mercado_libre/src/screens/registro_usuario.dart';
import 'package:mercado_libre/src/screens/perfil_usuario.dart';
import 'package:mercado_libre/src/screens/menu_users_06.dart';

class API extends StatelessWidget {
  const API({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API APP",
      home: const MenuPrincipal(),
      // home: PaginaRegistro(),
      routes: {
        '/home': (context) => const MenuPrincipal(),
        '/login': (context) => const InicioSesion(),
        '/registro': (context) => const FormularioRegistro(),
        '/perfil': (context) => const PerfilUsuario(),
        '/users': (context) => const MenuUsers()
      },
    );
  }
}