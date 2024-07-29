import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ModalUsuarios(BuildContext context) {
  dynamic fetchUsers;
 
  // conUsuarios().then

  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.event),
              ),
            ],
            backgroundColor: Colors.red[100],
            title: Text("Usuarios"),
          ),
        );
      });

  // showModalBottomSheet(
  //   context: context,
  //   builder: (BuildContext context){
  //     return Scaffold(
  //       appBar: AppBar(
  //         actions: [
  //           Padding(
  //             padding: EdgeInsets.all(8),
  //             child: Icon(Icons.event),
  //             ),
  //           ],
  //           backgroundColor: Colors.red[100],
  //           title: Text("Usuarios"),
  //           ),
  //           body: Center(
  //             child: ,)
  //     );
  //   }
  //   ){

  // };
}
