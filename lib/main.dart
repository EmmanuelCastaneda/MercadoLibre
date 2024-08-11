// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/src/';

// void main(List<String> args) {
//   runApp(MenuPrincipal());
// }
import 'package:flutter/material.dart';
import 'package:mercado_libre/src/contenido.dart';
// import 'package:/src/Contenido.dart';


void main(List<String> args) {
  runApp(const API());
}

////////////
/// APP Registro
///

// class MercadoLibre extends StatelessWidget {
//   const MercadoLibre({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MenuPrincipal(),
//     );
//   }
// }

// class MenuPrincipal extends StatelessWidget {
//   const MenuPrincipal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue[400],
//         foregroundColor: Colors.white,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Mercado Libre Col"),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/inicio');
//                 },
//                 child: Text("Iniciar Sesion"),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0), // <-- Radius
//                   ),
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.lightBlue[400],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(5.0),
//         child: Column(children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: "Buscar Producto",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide.none),
//                       filled: true,
//                       fillColor: Colors.grey[200]),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
//               IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: GridView.builder(
//                 // padding: EdgeInsets.all(10),

//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemCount: categorias.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     elevation: 2.0,
//                     margin: EdgeInsets.all(5),
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(categorias[index]['icono'],
//                                   size: 40.0, color: Colors.lightBlue[400]),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 categorias[index]['titulo'],
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 12.0, color: Colors.black87),
//                               ),
//                             ],
//                           ),

//                         )),
//                   );
                  
//                 }),
//           )
//         ]),
//       ),
//       bottomNavigationBar:
//                   BottomNavigationBar(
//                     items: [
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.home,
//                               size: 30.0, color: Colors.lightBlue[400]),
//                           label: "Inicio"),
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.shop,
//                               size: 30.0, color: Colors.lightBlue[400]),
//                           label: "Compra"),
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.exit_to_app_sharp,
//                               size: 30.0, color: Colors.lightBlue[400]),
//                           label: "Salir"),
//                     ],
//                   ),
//     );
//   }
// }

// final List<Map<String, dynamic>> categorias = [
//   {'codigo': '001', 'icono': Icons.home, 'titulo': 'Hogar y muebles'},
//   {'codigo': '002', 'icono': Icons.phone_android, 'titulo': 'Celulares'},
//   {'codigo': '003', 'icono': Icons.checkroom, 'titulo': 'Ropa y accesorios'},
//   {'codigo': '004', 'icono': Icons.computer, 'titulo': 'Computación'},
//   {'codigo': '005', 'icono': Icons.kitchen, 'titulo': 'Electro Hogar'},
//   {'codigo': '006', 'icono': Icons.sports_soccer, 'titulo': 'Deportes'},
//   {'codigo': '007', 'icono': Icons.build, 'titulo': 'Herramientas'},
//   {'codigo': '008', 'icono': Icons.brush, 'titulo': 'Belleza'},
//   {'codigo': '009', 'icono': Icons.tv, 'titulo': 'Electrónica y audio'},
//   {'codigo': '010', 'icono': Icons.fastfood, 'titulo': 'Alimentos y bebidas'},
//   {'codigo': '011', 'icono': Icons.pets, 'titulo': 'Animales y mascotas'},
// ];
