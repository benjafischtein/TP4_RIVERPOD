/*import 'package:flutter_riverpod/legacy.dart';
import '../entities/user.dart';

List<User> usuarios = [
  User(
    id: 0,
    nombre: 'Benjamin',
    email: 'benjaminfischtein@gmail.com',
    password: '1001001',
  ),

  User(
    id: 1,
    nombre: 'Peter', 
    email: 'pedrogomez2221@gmail.com', 
    password: '12345'
  ),

  User(
    id: 2,
    nombre: 'Martina', 
    email: 'martibenza@gmail.com', 
    password: '33333'
  ),

  User(
    id: 3,
    nombre: 'Lourdes',
    email: 'luligonzalez@gmail.com',
    password: '03032003',
  ),

  User(
    id: 4,
    nombre: 'Cynthia',
    email: 'cynthiafernandez@gmail.com',
    password: '322466',
  ),
];

StateProvider<List<User>> usersProvider = StateProvider((ref) => usuarios);*/

import 'package:flutter_riverpod/legacy.dart';
import '../entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersProvider = StateNotifierProvider(
  (ref) => UsersNotifier(FirebaseFirestore.instance)
);

class UsersNotifier extends StateNotifier<List<User>>{
  UsersNotifier(this.db) : super([]);


  FirebaseFirestore db;


  Future<void> getAllUsers() async {
    try {
      final docs = db.collection('usuarios').withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: (User user, _) => user.toFirestore()
        );
      final users = await docs.get().timeout(const Duration(seconds: 10));
      state = [...state, ...users.docs.map((d) => d.data())];
    } on FirebaseException catch (error) {
      print('Error de Firestore (${error.code}): ${error.message}');
    } catch (error) {
      print('Error al cargar usuarios: $error');
    }
  }

  Future<void> addUser(User user) async {
    final doc = db.collection('usuarios').doc();
    try {
      await doc.set(user.toFirestore());
      state = [...state, user];
    } catch (e) {
      print(e);
    }
  }
}