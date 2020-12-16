import 'dart:math' as math;

import 'package:test/test.dart';

class Rotas {
  int coordenadaX;
  int coordenadaY;
  double distancia;

  Rotas({this.coordenadaX, this.coordenadaY, this.distancia});

  @override
  String toString() => '[$coordenadaX,$coordenadaY]';
}

void calculaDistancia({Rotas cliente, List<Rotas> lojas}) {
  assert(
    cliente.coordenadaX != null,
    'coordenada X esta nula',
  );
  Rotas _cliente = cliente;
  List<Rotas> _lojas = lojas;

  for (int i = 0; i < _lojas.length; i++) {
    var calculateX = _lojas[i].coordenadaX - _cliente.coordenadaX;
    var calculateY = _lojas[i].coordenadaY - _cliente.coordenadaY;
    var elevateX = math.pow(calculateX, 2);
    var elevateY = math.pow(calculateY, 2);
    _lojas[i].distancia = math.sqrt(elevateX + elevateY);
  }
}

void ordenaLista(List<Rotas> lojas) {
  lojas.sort((a, b) => a.distancia.compareTo(b.distancia));
}

void main() {
  test('teste da centauro', () {
    // Arrange
    Rotas cliente;
    List<Rotas> lojas = List<Rotas>();

    cliente = Rotas(coordenadaX: 20, coordenadaY: 32, distancia: 0);
    lojas.add(Rotas(coordenadaX: 40, coordenadaY: 88, distancia: 0));
    lojas.add(Rotas(coordenadaX: 18, coordenadaY: 56, distancia: 0));
    lojas.add(Rotas(coordenadaX: 99, coordenadaY: 2, distancia: 0));

    // Act
    calculaDistancia(cliente: cliente, lojas: lojas);
    ordenaLista(lojas);

    // Assert
    expect(lojas.toString(), '[[18,56], [40,88], [99,2]]');
  });

  test('teste cliente com coordenada null', () {
    // Arrange
    Rotas cliente;
    List<Rotas> lojas = List<Rotas>();
    bool assertionError = false;
    cliente = Rotas(coordenadaX: null, coordenadaY: 32, distancia: 0);
    lojas.add(Rotas(coordenadaX: 40, coordenadaY: 88, distancia: 0));
    lojas.add(Rotas(coordenadaX: 18, coordenadaY: 56, distancia: 0));
    lojas.add(Rotas(coordenadaX: 99, coordenadaY: 2, distancia: 0));

    try {
      calculaDistancia(cliente: cliente, lojas: lojas);
    } on AssertionError {
      assertionError = true;
    }

    // Assert
    expect(assertionError, true);
  });
}
