import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../entities/paises.dart';
import '../providers/listapaises.dart';

// ignore: must_be_immutable
class Extra extends ConsumerWidget {
  Extra({super.key});

  final nombrecontroller = TextEditingController();
  final descripcioncontroller = TextEditingController();
  final capitalcontroller = TextEditingController();
  final poblacioncontroller = TextEditingController();
  final banderacontroller = TextEditingController();
  String ad = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Agregar país', 
                style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.bold
                ),
              ),
      
              SizedBox(height: 50),
      
              TextField(
                controller: nombrecontroller,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              
              TextField(
                controller: descripcioncontroller,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
              ),
              
              SizedBox(height: 20),
              
              TextField(
                controller: capitalcontroller,
                decoration: InputDecoration(
                  labelText: 'Capital',
                  border: OutlineInputBorder(),
                ),
              ),
              
              SizedBox(height: 20),
              
              TextField(
                controller: poblacioncontroller,
                decoration: InputDecoration(
                  labelText: 'Población',
                  border: OutlineInputBorder(),
                ),
              ),
              
              SizedBox(height: 20),
              
              TextField(
                controller: banderacontroller,
                decoration: InputDecoration(
                  labelText: 'Bandera',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {

                    if (nombrecontroller.text.isEmpty ||
                      descripcioncontroller.text.isEmpty ||
                      capitalcontroller.text.isEmpty ||
                      poblacioncontroller.text.isEmpty ||
                      banderacontroller.text.isEmpty) {

                      ad = 'Por favor, complete todos los campos.';

                    } else {
                      ad = 'País agregado correctamente.';       
                      final nuevoPais = Pais(
                        id: '', // El ID se generará automáticamente en Firestore
                        nombre: nombrecontroller.text,
                        descripcion: descripcioncontroller.text,
                        capital: capitalcontroller.text,
                        poblacion: int.tryParse(poblacioncontroller.text) ?? 0,
                        bandera: banderacontroller.text,
                      );
                      ref.read(countryProvider.notifier).addCountry(nuevoPais);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(ad),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    context.pop();
                  },
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}