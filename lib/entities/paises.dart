import 'package:cloud_firestore/cloud_firestore.dart';

class Pais {
  String id;
  String nombre;
  String descripcion;
  String capital;
  int poblacion;
  String bandera;

  Pais({
    required this.id,
    required this.nombre, 
    required this.descripcion, 
    required this.capital, 
    required this.poblacion,
    required this.bandera,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'capital': capital,
      'poblacion': poblacion,
      'bandera': bandera
    };
  }

  static Pais fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return Pais(
      id: data?['id'],
      nombre: data?['nombre'],
      descripcion: data?['descripcion'],
      capital: data?['capital'],
      poblacion: data?['poblacion'],
      bandera: data?['bandera']
    );
  }
}
