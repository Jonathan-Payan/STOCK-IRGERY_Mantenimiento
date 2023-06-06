import 'package:hola_mundo/src/providers/producto_provider.dart';
import 'package:hola_mundo/src/providers/flujo_inventario_provider.dart';
import 'package:hola_mundo/src/providers/usuario_provider.dart';
import 'package:hola_mundo/src/models/producto_model.dart';
import 'package:hola_mundo/src/models/flujo_inventario_model.dart';
import 'package:hola_mundo/src/models/usuario_model.dart';


void insertarDatosDePrueba() async {
// Ingresar datos de prueba para la tabla 'productos'
await producto_provider().nuevoProducto(producto_model(
id: 1,
codigo: 'A-1',
nombre: 'Cemento blanco 25kg',
precio: 36500,
detalles: 'Medio bulto cemento blanco - 25 kg',
cantidad: 25,
foto: 'assets/cementoB.jpeg',
creado_por: 1,
));


await producto_provider().nuevoProducto(producto_model(
id: 2,
codigo: 'A-2',
nombre: 'Cemento Gris 50kg',
precio: 33000,
detalles: 'Bulto cemento gris - 50 kg',
cantidad: 30,
foto: 'assets/cementoG.jpeg',
creado_por: 1,
));


// Ingresar datos de prueba para la tabla 'flujo_inventario'
await flujo_inventario_provider().nuevoFlujoInventario(flujo_inventario_model(
id: 1,
producto_id: 1,
tipo_movimiento: 'Entrada',
cantidad: 10,
fecha: DateTime.now(),
usuario_id: 1,
));


await flujo_inventario_provider().nuevoFlujoInventario(flujo_inventario_model(
id: 2,
producto_id: 1,
tipo_movimiento: 'Salida',
cantidad: 5,
fecha: DateTime.now(),
usuario_id: 1,
));


// Ingresar datos de prueba para la tabla 'usuarios'
await usuario_provider().nuevoUsuario(usuario_model(
id: 1,
nombre: 'John Doe',
email: 'johndoe@example.com',
password: '123456',
));


await usuario_provider().nuevoUsuario(usuario_model(
id: 2,
nombre: 'Jane Smith',
email: 'janesmith@example.com',
password: 'abcdef',
));


print('Datos de prueba insertados correctamente');
}







