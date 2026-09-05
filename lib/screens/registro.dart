import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:TP4_RIVERPOD/entities/user.dart';
import 'package:TP4_RIVERPOD/providers/listausuarios.dart';

class Registro extends ConsumerStatefulWidget {
  const Registro({super.key});

  @override
  ConsumerState<Registro> createState() => _RegistroState();
}

class _RegistroState extends ConsumerState<Registro> {

    TextEditingController usernameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    @override

    void initState() {
      super.initState();
      usernameController = TextEditingController();
      mailController = TextEditingController();
      passwordController = TextEditingController();
      confirmPasswordController = TextEditingController();
    }

    @override
    void dispose() {
      usernameController.dispose();
      mailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      super.dispose();
    }

    void trim(){
      usernameController.text = usernameController.text.trim();
      mailController.text = mailController.text.trim();
      passwordController.text = passwordController.text.trim();
      confirmPasswordController.text = confirmPasswordController.text.trim();
    }

    String ad = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 32),

              Text(
                'Registrar nuevo usuario',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
        
              SizedBox(height: 80),
        
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Nombre de usuario'),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirmar contraseña'),
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
                      trim();

                      if(passwordController.text != confirmPasswordController.text){
                        ad = 'Las contraseñas no coinciden';
                      } else if(usernameController.text.isEmpty || mailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty){
                        ad = 'Todos los campos son obligatorios';
                      } else {
                        ad = 'Usuario registrado exitosamente';

                        List<User> usuarios = ref.read(usersProvider);

                        usuarios.add(
                          User(
                            id: usuarios.length,
                            nombre: usernameController.text,
                            email: mailController.text,
                            password: passwordController.text,
                          )
                        );
                        context.push('/login');
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(ad),
                        ),
                      );
                    });
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
