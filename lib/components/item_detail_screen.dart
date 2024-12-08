import 'package:flutter/material.dart';
import 'package:deep_waste/models/Category.dart';
import 'package:deep_waste/controller/tips_notifier.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatefulWidget {
  final Category category;

  const ItemDetailScreen({Key key, @required this.category}) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final tipsNotifier = Provider.of<TipsNotifier>(context, listen: false);
    final category = widget.category;

    // Filtrar los tips para la categoría seleccionada
    final tipsForCategory = tipsNotifier.rewards.firstWhere(
        (tip) => tip.name.toLowerCase() == category.name.toLowerCase(),
        orElse: () => null);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Consejos de Gestión de Residuos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      category.description ?? 'El reciclaje es fundamental para proteger el medio ambiente, ahorrar energía, reducir la contaminación y conservar los recursos naturales, promoviendo una economía más sostenible y ayudando a preservar el planeta para las futuras generaciones.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      category.imageURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Contenedor celeste para mostrar los tips
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF7DD3F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ExpansionTile(
                title: Text(
                  'Consejos para gestionar residuos de ${category.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                children: [
                  if (tipsForCategory != null)
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: tipsForCategory.tips.map((tip) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '. $tip',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'No hay tips disponibles para esta categoría.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
