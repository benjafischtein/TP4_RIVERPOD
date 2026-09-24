import 'package:flutter_riverpod/legacy.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final countryProvider = StateNotifierProvider(
  (ref) => CountriesNotifier(FirebaseFirestore.instance)
);

class CountriesNotifier extends StateNotifier<List<Pais>>{
  CountriesNotifier(this.db) : super([]);

  FirebaseFirestore db;


  Future<void> getAllMovies() async {
    try {
      final docs = db.collection('paises').withConverter(
          fromFirestore: Pais.fromFirestore,
          toFirestore: (Pais pais, _) => pais.toFirestore()
        );
      final paises = await docs.get().timeout(const Duration(seconds: 10));
      state = [...state, ...paises.docs.map((d) => d.data())];
    } on FirebaseException catch (error) {
      print('Error de Firestore (${error.code}): ${error.message}');
    } catch (error) {
      print('Error al cargar paises: $error');
    }
  }
  
}