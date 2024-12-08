class Category {
  final String id;
  final String imageURL;
  final int points;
  final String name;
  final String description; // Nuevo campo para la descripción

  Category({this.id, this.name, this.imageURL, this.points, this.description});

  factory Category.fromMap(Map<String, dynamic> json) => new Category(
    id: json['id'],
    name: json['name'],
    imageURL: json['imageURL'],
    points: json['points'],
    description: json['description'], // Agregar esta línea para incluir la descripción
  );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "imageURL": imageURL,
      "points": points,
      "description": description,  // Incluir el nuevo campo
    };
  }
}
