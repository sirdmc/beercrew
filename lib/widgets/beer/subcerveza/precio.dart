
class Precio {

  int precio = 1000;
  String valor;
  String parte1;
  String parte2;
  String parte3;

  void precioFuntion () {

    if (precio < 1000) {
      valor = precio.toString();
      print(valor);
    } if (precio < 10000) {
      valor = precio.toString();
      parte1 = valor[0];
      parte2 = valor.substring(1,3);
      print('$parte1.$parte2');
    } if (precio < 100000) {
      valor = precio.toString();
      parte1 = valor.substring(0,1);
      parte2 = valor.substring(2,4);
      print('$parte1.$parte2');
    } if (precio < 10000000) {
      valor = precio.toString();
      parte1 = valor.substring(0,2);
      parte2 = valor.substring(3,5);
      print('$parte1.$parte2');
    }
  }
}