import 'package:flutter/material.dart';
import 'package:mercado_libre/src/controllers/consultarUsuarios.dart';

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
        backgroundColor:Colors.lightBlue[400] ,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon:Icon(Icons.arrow_back,color: Colors.white,)),
        title:Text("Administrar usuarios",
        style: TextStyle(color: Colors.white),),
        ),
        body: ListView(
          // itemCount: consultarusuarios1.length,
          // itemBuilder: (BuildContext context, int index  ){
          //   return ListTile(
          //     title: Text(consultarusuarios1[index].name),
          //     subtitle: Text(consultarusuarios1[index].name),
          //     trailing: Icon(Icons.delete),
          //   );
          // }
          children: [Image.network("https://cdn-icons-png.flaticon.com/512/1535/1535024.png",width: 300,height: 300,
          ),SizedBox(height: 16.0,),
          ListTile(title: Text("Usuarios"),
          leading: Icon(Icons.connect_without_contact_rounded),
          trailing: Icon(Icons.arrow_circle_right_outlined),
          onTap: (){  },),
          SizedBox(height: 16.0,),
          ListTile(title: Text("Buscar Usuarios"),
          leading: Icon(Icons.person_2_rounded),
          trailing: Icon(Icons.arrow_circle_right_outlined),
          onTap: (){  },),
          SizedBox(height: 16.0,),
          ListTile(title: Text("Solicitudes"),
          leading: Icon(Icons.connect_without_contact_rounded),
          trailing: Icon(Icons.arrow_circle_right_outlined),
          onTap: (){  },),
          SizedBox(height: 16.0,),
          ListTile(title: Text("Solicitudes"),
          leading: Icon(Icons.connect_without_contact_rounded),
          trailing: Icon(Icons.arrow_circle_right_outlined),
          onTap: (){  },)
          ],),
    );
    
  }
}
