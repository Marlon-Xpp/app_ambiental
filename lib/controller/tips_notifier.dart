import 'dart:collection';
import 'dart:math';
import 'package:deep_waste/models/Tips.dart';
import 'package:flutter/material.dart';

class TipsNotifier extends ChangeNotifier {
  List<Tips> _tips = [
    Tips("1001", "plastic", [
      "Reduce: Intenta usar menos plástico comprando productos con menos empaques, llevando tus propias bolsas y recipientes a la tienda, y evitando los plásticos de un solo uso como popotes y botellas de agua.",
      "Reutiliza: Usa los artículos de plástico varias veces antes de desecharlos, como las bolsas de compras reutilizables, los recipientes para sobras y las botellas de agua recargables.",
      "Recicla: Separa los artículos de plástico por su símbolo de reciclaje y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos plásticos con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos plásticos y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos plásticos, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas al plástico, como popotes reutilizables, envases biodegradables, cepillos de dientes de bambú, etc."
    ]),
    Tips("1002", "paper", [
      "Reduce: Intenta usar menos papel cambiando a documentos electrónicos, usando ambos lados de una hoja de papel y evitando la impresión innecesaria.",
      "Reutiliza: Usa los artículos de papel varias veces antes de desecharlos, como usar papel reciclado para notas o usar periódicos viejos como material de embalaje.",
      "Recicla: Separa los artículos de papel por tipo y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos de papel con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos de papel y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos de papel, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas al papel, como documentos electrónicos, servilletas o pañuelos de tela, libros electrónicos, etc.",
      "Elige productos de papel con alto contenido reciclado postconsumo.",
      "Usa opciones de facturación sin papel, cancela suscripciones a correos no deseados."
    ]),
    Tips("1003", "biológico", [
      "Reduce: Intenta generar menos residuos comprando alimentos menos procesados, compostando los restos de comida y evitando los productos desechables de un solo uso.",
      "Composta: Composta tus restos de comida y residuos de jardín en lugar de enviarlos al vertedero. Esto creará un suelo rico en nutrientes para tu jardín.",
      "Recicla: Algunos residuos de alimentos pueden reciclarse para alimentar animales o producir biocombustibles.",
      "Educa: Comparte la importancia de gestionar los residuos biológicos con amigos y familiares, e incentiva a otros a reducir, compostar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos biológicos y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos biológicos, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas a los productos desechables, como recipientes y utensilios reutilizables, servilletas de tela, productos compostables.",
      "Inicia un programa comunitario de compostaje.",
      "Usa vermicompostaje para compostaje a pequeña escala, es fácil y eficiente."
    ]),
    Tips("1004", "glass", [
      "Reduce: Intenta usar menos vidrio comprando productos con menos empaques, usando recipientes reutilizables y evitando los artículos de vidrio de un solo uso.",
      "Reutiliza: Usa los artículos de vidrio varias veces antes de desecharlos, como usar frascos de vidrio para almacenamiento o rellenar botellas de vidrio.",
      "Recicla: Separa los artículos de vidrio por color y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos de vidrio con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos de vidrio y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos de vidrio, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas al vidrio, como recipientes de silicona o acero inoxidable, o empaques basados en papel.",
      "Usa esquemas de retorno de depósito en botellas de vidrio, fomenta el reciclaje.",
      "Considera usar botellas de vidrio en lugar de botellas de plástico cuando sea posible, es más ecológico."
    ]),
    Tips("1005", "metal", [
      "Reduce: Intenta usar menos metal comprando productos con menos empaques, usando recipientes reutilizables y evitando los artículos de metal de un solo uso.",
      "Reutiliza: Usa los artículos de metal varias veces antes de desecharlos, como usar recipientes de metal para almacenamiento o rellenar latas de metal.",
      "Recicla: Separa los artículos de metal por tipo y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos de metal con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos de metal y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos de metal, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas al metal, como utensilios de bambú o madera, o empaques basados en papel.",
      "Usa centros de reciclaje de metales, reduce la necesidad de extraer nuevos materiales.",
      "Evita productos hechos de materiales mixtos (como latas de metal recubiertas de plástico) ya que son difíciles de reciclar y suelen desecharse."
    ]),
    Tips("1006", "cardboard", [
      "Reduce: Intenta usar menos cartón comprando productos con menos empaques, usando recipientes reutilizables y evitando cajas de envío innecesarias.",
      "Reutiliza: Usa los artículos de cartón varias veces antes de desecharlos, como usar cajas de cartón para almacenamiento o material de embalaje.",
      "Recicla: Separa los artículos de cartón por tipo y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos de cartón con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos de cartón y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente los residuos de cartón, no los arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas al cartón, como empaques basados en papel o materiales biodegradables.",
      "Usa centros de reciclaje de cartón corrugado, reduce la necesidad de cortar árboles para fabricar nuevo cartón.",
      "Elige productos con empaques mínimos o productos sin empaques y fomenta a otros a hacer lo mismo."
    ]),
    Tips("1007", "trash", [
      "Reduce: Intenta generar menos residuos comprando menos productos, usando recipientes reutilizables y evitando los artículos desechables de un solo uso.",
      "Reutiliza: Usa los artículos varias veces antes de desecharlos, como usar recipientes reutilizables para almacenamiento o rellenar botellas.",
      "Recicla: Separa los artículos por tipo y ponlos en el contenedor de reciclaje correspondiente.",
      "Educa: Comparte la importancia de gestionar los residuos con amigos y familiares, e incentiva a otros a reducir, reutilizar y reciclar.",
      "Apoya: Apoya a las empresas y organizaciones que trabajan para reducir los residuos y promover prácticas sostenibles.",
      "Desecho adecuado: Desecha correctamente la basura, no la arrojes en la vía pública.",
      "Apoya alternativas: Considera alternativas a los desechables, como recipientes y utensilios reutilizables, servilletas de tela, productos biodegradables.",
      "Inicia un programa comunitario de reciclaje.",
      "Incorpora una \"jerarquía de residuos\" en tu rutina, priorizando la reducción, reutilización y reciclaje sobre el envío de residuos a vertederos o incineradoras.",
      "Considera realizar una auditoría de residuos para identificar los tipos más comunes de residuos en tu hogar u oficina y desarrollar un plan para reducir o reciclar esos artículos."
    ])
  ];

  UnmodifiableListView<Tips> get rewards => UnmodifiableListView(_tips);

  Tips getRandomTip() {
    final _random = new Random();
    return _tips[_random.nextInt(_tips.length)];
  }
}
