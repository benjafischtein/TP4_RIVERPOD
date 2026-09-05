import 'package:flutter_riverpod/legacy.dart';
import 'package:TP4_RIVERPOD/entities/user.dart';

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

StateProvider<List<User>> usersProvider = StateProvider((ref) => usuarios);
