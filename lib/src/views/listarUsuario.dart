import 'package:flutter/material.dart';

import 'package:hola_mundo/src/providers/usuario_provider.dart';
import 'package:hola_mundo/src/providers/producto_provider.dart';
import 'package:hola_mundo/src/views/crearProducto.dart';

class ListaUsuario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaUsuarioState();
  }
}

class _ListaUsuarioState extends State<ListaUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de usuarios'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Buscar",
              onPressed: () => {})
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: UsuarioProvider.getUsuarios(),
          builder: (BuildContext context,
              AsyncSnapshot<List<UsuarioModel?>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Usuario: ${snapshot.data![index]!.id}'),
                      subtitle: Column(
                        children: [
                          Text('Nombre: ${snapshot.data![index]!.nombre} '),
                          Text('Correo: ${snapshot.data![index]!.correo} '),
                          Text(
                              'Contraseña: ${snapshot.data![index]!.contrasenia} '),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error al cargar los usuarios');
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              guardarDatos();
            },
            child: Icon(Icons.add),
            heroTag: 'btn1',
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              eliminarDatos();
            },
            child: Icon(Icons.delete),
            heroTag: 'btn2',
          )
        ],
      ),
    );
  }

  guardarDatos() async {
    try {
      await UsuarioProvider.nuevoUsuario(UsuarioModel(
          id: 1,
          nombre: "Alejandro",
          correo: "alejandro@gmail.com",
          contrasenia: "1234"));

      await UsuarioProvider.nuevoUsuario(UsuarioModel(
          id: 2,
          nombre: "Brayan",
          correo: "brayan@gmail.com",
          contrasenia: "1234"));

      await UsuarioProvider.nuevoUsuario(UsuarioModel(
          id: 3,
          nombre: "Albert",
          correo: "albert@gmail.com",
          contrasenia: "1234"));

      await UsuarioProvider.nuevoUsuario(UsuarioModel(
          id: 4,
          nombre: "Miguel",
          correo: "miguel@gmail.com",
          contrasenia: "1234"));
    } catch (e) {
      print('Error al guardar los usuarios: $e');
    }

    UsuarioProvider.getUsuarios();
    ProductoProvider.getProductos();
  }

  eliminarDatos() async {
    try {
      await ProductoProvider.eliminarTodosLosProductos();
      await UsuarioProvider.eliminarTodosUsuarios();
    } catch (e) {
      print('Error al eliminar los datos: $e');
    }
  }
}
