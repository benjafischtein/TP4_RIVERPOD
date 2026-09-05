import 'package:flutter/material.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';

class Detalles extends StatelessWidget {
  final Pais paisSeleccionado;

  const Detalles({super.key, required this.paisSeleccionado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          paisSeleccionado.nombre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Capital: ${paisSeleccionado.capital}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Población: ${paisSeleccionado.poblacion}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Descripción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              paisSeleccionado.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Image.network(
              paisSeleccionado.bandera,
              height: 300,
              width: 466.67,
              fit: BoxFit.cover,
            ),
          ],
        ),
      )
    );
  }
}
