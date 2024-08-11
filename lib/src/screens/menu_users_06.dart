import 'package:flutter/material.dart';
import 'package:mercado_libre/src/screens/modal_users2_01.dart';
// import 'package:mercado_libre/src/controllers/consultarUsuarios.dart';

class MenuUsers extends StatefulWidget {
  const MenuUsers({super.key});
  @override
  State<MenuUsers> createState() => _MenuUsersState();
}

class _MenuUsersState extends State<MenuUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Administrar usuarios",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/1535/1535024.png",
            width: 300,
            height: 300,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListTile(
            title: const Text("Usuarios"),
            leading: const Icon(Icons.connect_without_contact_rounded),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () {
              modalUsuario(context);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListTile(
            title: const Text("Buscar Usuarios"),
            leading: const Icon(Icons.person_2_rounded),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () {
              // UserModal(context);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListTile(
            title: const Text("Solicitudes"),
            leading: const Icon(Icons.connect_without_contact_rounded),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListTile(
            title: const Text("Informes"),
            leading: const Icon(Icons.computer),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
