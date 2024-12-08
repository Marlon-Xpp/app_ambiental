double getNumber(double input, {int precision = 2}) {
  // Convertimos el número a cadena
  String inputString = '$input';

  // Comprobamos si el número tiene un punto decimal
  int decimalIndex = inputString.indexOf('.');

  // Si no tiene punto decimal o el número no tiene suficientes decimales,
  // simplemente devolvemos el número redondeado con la precisión especificada
  if (decimalIndex == -1 || inputString.length <= decimalIndex + precision) {
    return double.parse(inputString);  // Si no tiene decimales, devolvemos el número tal cual
  }

  // Si tiene punto decimal, obtenemos la subcadena con la precisión correcta
  return double.parse(inputString.substring(0, decimalIndex + precision + 1));
}
