import 'dart:collection';
import 'package:deep_waste/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  List<Category> _categories = [
    Category(
        id: "1001",
        name: "Cardboard",
        imageURL: "assets/images/cardboard.png",
        points: 36,
        description: "El cartón es un material reciclable utilizado principalmente en embalajes. Su reciclaje ayuda a reducir el consumo de madera.",
        ),
    Category(
        id: "1004",
        name: "Paper",
        imageURL: "assets/images/paper.png",
        points: 38,
        description: "El papel es un material reciclable común que se puede reutilizar para reducir el desperdicio y preservar los recursos naturales.",
        ),
    Category(
        id: "1002",
        name: "Glass",
        imageURL: "assets/images/glass.png",
        points: 3,
        description: "El vidrio es 100% reciclable y puede reutilizarse muchas veces sin perder calidad, lo que lo convierte en un excelente material sostenible.",
        ),
    Category(
        id: "1003",
        name: "Metal",
        imageURL: "assets/images/metal.png",
        points: 68,
        description: "El metal es un recurso valioso que se puede reciclar para ahorrar energía y reducir la necesidad de extracción minera.",
        ),
    Category(
        id: "1005",
        name: "Plastic",
        imageURL: "assets/images/plastic.png",
        points: 18,
        description: "El plástico es un material sintético que se utiliza en muchos productos de uso cotidiano. Su reciclaje es fundamental para reducir la contaminación.",
        ),
    Category(
        id: "1006",
        name: "Trash",
        imageURL: "assets/images/trash.png",
        points: 35,
        description: "La basura incluye residuos que no pueden ser reciclados o reutilizados. Es importante reducir su generación para minimizar el impacto ambiental.",
        )
  ];

  // Método para obtener las categorías
  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);

  // Método para actualizar las categorías
  void updateCategories(List<Category> newCategories) {
    _categories = newCategories;  // Actualiza las categorías con los nuevos datos
    notifyListeners();  // Notifica a los listeners que los datos han cambiado
  }

  // Método para añadir una nueva categoría (opcional, si quieres añadir más categorías)
  void addCategory(Category newCategory) {
    _categories.add(newCategory);
    notifyListeners();  // Notifica que se añadió una nueva categoría
  }
}
