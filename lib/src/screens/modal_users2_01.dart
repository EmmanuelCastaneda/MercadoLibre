
import 'package:flutter/material.dart';
import 'package:mercado_libre/src/controllers/users.dart';

modalUsuario(BuildContext context) {
  consultarUsuarios().then((usuarios) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Scaffold(
                appBar: AppBar(
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.event),
                    )
                  ],
                  backgroundColor: Colors.amber[600],
                  foregroundColor: Colors.white,
                  title: const Text('Usuarios'),
                ),
                body: ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(usuarios[index].name),
                      subtitle: Text(usuarios[index].email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit_rounded,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              _showActualizarUsuario(
                                context,
                                usuarios[index],
                                () {
                                  setState(() {
                                    consultarUsuarios().then((usuarioActualizado) {
                                      usuarios = usuarioActualizado;
                                    });
                                  });
                                }
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              _showEliminarUsuario(
                                context,
                                usuarios[index].id,
                                () {
                                  deleteUsers(usuarios[index].id).then((value) {
                                    setState(() {
                                      usuarios.removeAt(index);
                                    });
                                  }).catchError((error) {
                                    print('Error al eliminar el usuario: $error');
                                  });
                                }
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        });
  }).catchError((error) {
    // Manejo de errores
    print('Error: $error');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error al obtener usuarios: $error'),
    ));
  });
}


void _showActualizarUsuario(
    BuildContext context, Users usuario, VoidCallback onUserUpdated) {
  TextEditingController nameController =
      TextEditingController(text: usuario.name);
  TextEditingController emailController =
      TextEditingController(text: usuario.email);
  TextEditingController passwordController =
      TextEditingController(text: usuario.password);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Actualizar usuario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Actualizar'),
            onPressed: () {
              String name = nameController.text;
              String email = emailController.text;
              String password = passwordController.text;

              if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                updateUsers(usuario.id, name, email, password)
                    .then((updatedUser) {
                  Navigator.of(context).pop();
                  onUserUpdated();
                }).catchError((error) {
                  print('Error al actualizar el usuario: $error');
                  Navigator.of(context).pop();
                });
              } else {
                print('¡Completa todos los campos!');
              }
            },
          ),
        ],
      );
    },
  );
}


void _showEliminarUsuario(BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmación.'),
        content: const Text('¿Está seguro de eliminar el usuario?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Eliminar'),
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteConfirmed();
            },
          ),
        ],
      );
    }
  );
}

// ModalConsultarUsuarios(BuildContext context) {
//   dynamic fetchUsers;
//     void _showEliminarUsuario(
//       BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Confirmar eliminacion"),
//             content: Text('¿estas seguro de que desea eliminar este usuario?'),
//             actions: [
//               TextButton(
//                 child: Text('Cancelar'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text('Eliminar'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   onDeleteConfirmed();
//                 },
//               )
//             ],
//           );
//         });
//   }
//   consultarUsuarios().then((consultarUsuarios) {
//     fetchUsers = consultarUsuarios;

//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Scaffold(
//             appBar: AppBar(
//               actions: [
//                 Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Icon(Icons.event),
//                 ), // Padding
//               ],
//               backgroundColor: Colors.red[100],
//               title: Text("Usuarios"),
//             ), // AppBar
//             body: ListView.builder(
//               itemCount: consultarUsuarios.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(consultarUsuarios[index].name),
//                   subtitle: Text(consultarUsuarios[index].name),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.update,
//                           color: Colors.purple,
//                         ),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         ),
//                         onPressed: () {
//                           _showEliminarUsuario(
//                             context,
//                             consultarUsuarios[index].id,
//                             (){
//                               deleteUsers(consultarUsuarios[index].id)
//                               .then((value) {
//                             setState(() {
//                               consultarUsuarios.removeAt(index);
//                             });
//                           }).catchError((error) {
//                             print('Error al eliminar usuario:$error');
//                           });
//                             }
//                           );
//                         },
//                       )
//                     ],
//                   ),
//                 );
//               },
//               // child: Text(fetchUsers[0].name),
//             ), // Center
//           );
//         });
//   });

// }
