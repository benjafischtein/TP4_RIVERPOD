import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:TP4_RIVERPOD/providers/listausuarios.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final usuarios = ref.watch(usersProvider);
    TextEditingController passwordController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    String ad = '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 32),

              Text(
                '¡Bienvenido! Ingresa tus datos',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 100),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      mailController.text = mailController.text.trim();
                      passwordController.text = passwordController.text.trim();
                      bool camposVacios =
                          mailController.text.isEmpty ||
                          passwordController.text.isEmpty;
                      bool usuarioNoEncontrado = !usuarios.any(
                        (user) => user.email == mailController.text,
                      );
                      bool usuarioIncorrecto = usuarios.any(
                        (user) =>
                            user.email == mailController.text &&
                            user.password != passwordController.text,
                      );

                      if (camposVacios) {
                        ad =
                            'Los campos no pueden estar vacíos. Ingresa datos válidos.';
                      } else if (usuarioNoEncontrado) {
                        ad =
                            'El usuario no existe. Verifica tu mail e intenta nuevamente.';
                      } else if (usuarioIncorrecto) {
                        ad = 'Contraseña incorrecta. Intenta nuevamente.';
                      } else {
                        ad = '¡Inicio de sesión exitoso!';
                        context.go('/lista', extra: usuarios.firstWhere((user) => user.email == mailController.text).nombre);
                      }
                    });
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(ad)));
                  },
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              Text(
                '¿No tienes cuenta?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/registro');
                  },
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
