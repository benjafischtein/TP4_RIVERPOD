import 'package:go_router/go_router.dart';
import 'package:TP4_RIVERPOD/screens/login.dart';
import 'package:TP4_RIVERPOD/screens/lista.dart';
import 'package:TP4_RIVERPOD/screens/detalles.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';
import 'package:TP4_RIVERPOD/screens/agregarpais.dart';
import 'package:TP4_RIVERPOD/screens/registro.dart';
import 'package:TP4_RIVERPOD/screens/editarpais.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/registro', builder: (context, state) => Registro()),

    GoRoute(path: '/login', builder: (context, state) => Login()),

    GoRoute(path: '/lista', builder: (context, state) => Lista(nombre: state.extra as String)),

    GoRoute(
      path: '/resultados',
      builder: (context, state) =>
          Detalles(paisSeleccionado: state.extra as Pais),
    ),
    GoRoute(
      path: '/extra',
      builder: (context, state) => Extra(),
    ),

    GoRoute(path: '/editar', builder: (context, state) => EditarElemento(paisSeleccionado: state.extra as Pais)),
  ],
);
