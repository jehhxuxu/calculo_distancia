import 'dart:math' as math;

class Rotas {
  int coordenadaX;
  int coordenadaY;
  double distancia;

  Rotas({this.coordenadaX, this.coordenadaY, this.distancia});
}

void main() {
  Rotas cliente = new Rotas(coordenadaX: 5, coordenadaY: 10, distancia: 0);
  List<Rotas> lojas = List<Rotas>();
  lojas.add(Rotas(coordenadaX: 40, coordenadaY: 88, distancia: 0));
  lojas.add(Rotas(coordenadaX: 18, coordenadaY: 56, distancia: 0));
  lojas.add(Rotas(coordenadaX: 99, coordenadaY: 2, distancia: 0));
  lojas.add(Rotas(coordenadaX: 14, coordenadaY: 99, distancia: 0));
  lojas.add(Rotas(coordenadaX: 10, coordenadaY: 2, distancia: 0));
  lojas.add(Rotas(coordenadaX: 15, coordenadaY: 100, distancia: 0));

  for (int i = 0; i < lojas.length; i++) {
    var calculateX = lojas[i].coordenadaX - cliente.coordenadaX;
    var calculateY = lojas[i].coordenadaY - cliente.coordenadaY;
    var elevateX = math.pow(calculateX, 2);
    var elevateY = math.pow(calculateY, 2);
    lojas[i].distancia = math.sqrt(elevateX + elevateY);
    print(lojas[i].distancia);
  }
  lojas.sort((a, b) => a.distancia.compareTo(b.distancia));

  var listaOrdenada = List<String>();
  lojas.forEach((element) {
    listaOrdenada.add('[${element.coordenadaX},${element.coordenadaY}]');
  });
  print(listaOrdenada);
}
