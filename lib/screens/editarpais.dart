import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';
import 'package:TP4_RIVERPOD/providers/listapaises.dart';

// ignore: must_be_immutable
class EditarElemento extends ConsumerWidget {
  EditarElemento({super.key, required this.paisSeleccionado});

  final Pais paisSeleccionado;
  late final nombrecontroller = TextEditingController(text: paisSeleccionado.nombre);
  late final descripcioncontroller = TextEditingController(text: paisSeleccionado.descripcion);
  late final capitalcontroller = TextEditingController(text: paisSeleccionado.capital);
  late final poblacioncontroller = TextEditingController(text: paisSeleccionado.poblacion.toString());
  late final banderacontroller = TextEditingController(text: paisSeleccionado.bandera);
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
                'Editar país',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
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
                      paisSeleccionado.nombre = nombrecontroller.text;
                      paisSeleccionado.descripcion = descripcioncontroller.text;
                      paisSeleccionado.capital = capitalcontroller.text;
                      paisSeleccionado.poblacion = int.tryParse(poblacioncontroller.text) ?? 0;
                      paisSeleccionado.bandera = banderacontroller.text;
                
                      Pais paisActualizado = Pais(
                        id: paisSeleccionado.id,
                        nombre: nombrecontroller.text,
                        descripcion: descripcioncontroller.text,
                        capital: capitalcontroller.text,
                        poblacion: int.tryParse(poblacioncontroller.text) ?? 0,
                        bandera: banderacontroller.text,
                      );
                
                      List<Pais> paises = ref.read(paisesProvider.notifier).state;
                      int index = paises.indexWhere((pais) => pais.id == paisSeleccionado.id);
                
                      if (index != -1) {
                        paises[index] = paisActualizado;
                        ref.read(paisesProvider.notifier).state = List.from(paises);
                      }
                
                      context.pop();
                    }
                  },
                  child: Text(
                    'Guardar cambios',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
