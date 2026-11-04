import 'package:go_router/go_router.dart';
import '../screens/login.dart';
import '../screens/lista.dart';
import '../screens/detalles.dart';
import '../entities/paises.dart';
import '../screens/agregarpais.dart';
import '../screens/registro.dart';
import '../screens/editarpais.dart';

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
