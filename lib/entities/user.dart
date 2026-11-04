import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  int id;
  String nombre;
  String email;
  String password;

  User({required this.id, required this.email, required this.password, required this.nombre});

    Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'password': password,
      'createdAt': FieldValue.serverTimestamp()
    };
  }

  static User fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return User(
      id: data?['id'],
      nombre: data?['nombre'],
      email: data?['email'],
      password: data?['password']
    );
  }
}
