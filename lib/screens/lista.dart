import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';
import 'package:TP4_RIVERPOD/providers/listapaises.dart';

class Lista extends ConsumerStatefulWidget {
  const Lista({super.key, required this.nombre});

  final String nombre;

  @override
  ConsumerState<Lista> createState() => _ListaState();
}

class _ListaState extends ConsumerState<Lista> {
  @override
  Widget build(BuildContext context) {
    final paises = ref.watch(paisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Paises de ${widget.nombre}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            setState((){
              context.go('/login');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Cierre de sesión exitoso.'),
                  duration: Duration(seconds: 2),
                ),
              );
            });
          },
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paises.length,
                itemBuilder: (context, index) {
                  final Pais pais = paises[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(pais.nombre),
                        leading: Image.network(
                          pais.bandera,
                          height: 90,
                          width: 140,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          context.push('/resultados', extra: pais);
                        },
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                context.push('/editar', extra: pais);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  paises.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10, child: Divider(color: Colors.grey[400])),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.push('/extra', extra: 'Añadir país');
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue,
              ),
              child: const Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
