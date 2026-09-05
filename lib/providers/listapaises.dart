import 'package:flutter_riverpod/legacy.dart';
import 'package:TP4_RIVERPOD/entities/paises.dart';


StateProvider<List<Pais>> paisesProvider = StateProvider((ref) => [
  Pais(
    id: 0,
    nombre: 'Argentina',
    descripcion:
        'Argentina es un país ubicado en América del Sur, conocido por su diversidad geográfica, su cultura vibrante y su pasión por el fútbol. Su capital es Buenos Aires y su población es de aproximadamente 45 millones de personas.',
    capital: 'Buenos Aires',
    poblacion: 45000000,
    bandera:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI9Zo7lynpCukHacJCz0evJrSJvJ_9lWPrUR9RQEsZjNPNrZaM_NFi5PY&s=10',
  ),
  Pais(
    id: 1,
    nombre: 'Brasil',
    descripcion:
        'Brasil es el país más grande de América del Sur y el quinto más grande del mundo. Es famoso por su biodiversidad, sus playas, el Carnaval de Río y su pasión por el fútbol. Su capital es Brasilia y su población supera los 210 millones de personas.',
    capital: 'Brasilia',
    poblacion: 210000000,
    bandera:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaXC7jmILbY-zEBH2KvuKzM7Dyl37-NX_NqSN6bG1NhA&s=10',
  ),
  Pais(
    id: 2,
    nombre: 'Chile',
    descripcion:
        'Chile es un país largo y estrecho ubicado en la costa occidental de América del Sur. Es conocido por sus paisajes diversos, que incluyen desiertos, montañas y glaciares. Su capital es Santiago y su población es de aproximadamente 19 millones de personas.',
    capital: 'Santiago',
    poblacion: 19000000,
    bandera:
        'https://thumbs.dreamstime.com/b/indicador-de-grunge-chile-bandera-chilena-con-textura-del-grunge-92388936.jpg',
  ),
  Pais(
    id: 3,
    nombre: 'Colombia',
    descripcion:
        'Colombia es un país situado en el noroeste de América del Sur, conocido por su diversidad cultural, sus paisajes montañosos y su producción de café. Su capital es Bogotá y su población es de aproximadamente 50 millones de personas.',
    capital: 'Bogotá',
    poblacion: 50000000,
    bandera:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3PzD7qalmo4O3jHm-WPwjHNZVyZSWRU96pP-NLnDauSmOFMRn9IIXpKzk&s=10',
  ),
  Pais(
    id: 4,
    nombre: 'México',
    descripcion:
        'México es un país ubicado en América del Norte, conocido por su rica historia, su cultura vibrante y su gastronomía. Su capital es Ciudad de México y su población supera los 126 millones de personas.',
    capital: 'Ciudad de México',
    poblacion: 126000000,
    bandera:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcWs4yHzISI5aYaEu-2Lb6AJ6YKXqfRNbfQ70ddLMpiQ&s=10',
  ),
]
);
