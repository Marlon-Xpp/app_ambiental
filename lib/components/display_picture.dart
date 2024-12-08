import 'dart:io';
import 'package:deep_waste/components/default_button.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:deep_waste/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DisplayPicture extends StatefulWidget {
  final File image;
  final List<Item> items;
  const DisplayPicture({Key key, this.image, this.items}) : super(key: key);
  @override
  _DisplayPictureState createState() => _DisplayPictureState(image: this.image);
}

class _DisplayPictureState extends State<DisplayPicture> {
  final File image;
  _DisplayPictureState({this.image});
  String selectedCategory;
  bool categorySelected = false;

  // Lista de categorías de reciclaje con sus puntos correspondientes
  // final Map<String, int> recyclingCategories = {
  final List<String> recyclingCategories = [
    'Cardboard',
    'Glass',
    'Metal',
    'Paper',
    'Plastic',
    'Trash',
  ];

  @override
  void initState() {
    super.initState();
  }

  // Método para actualizar el ítem con los puntos correspondientes a la categoría seleccionada
  Future<void> updateItem(List<Item> items, String itemName) async {
    print('Buscando ítem con nombre: $itemName');

    var matchedItem = items.firstWhere(
      (_item) => _item.name.toLowerCase() == itemName.toLowerCase(),
      orElse: () => null,
    );

    if (matchedItem != null) {
      print('Ítem encontrado: ${matchedItem.name}, veces registrado: ${matchedItem.count}');

      // Incrementar el contador de veces que se ha registrado este item
      matchedItem.count += 1;

      // No modificamos los puntos, solo incrementamos el contador
      print('Ítem actualizado: ${matchedItem.name}, contador incrementado: ${matchedItem.count}');

      // Actualizar el item en la base de datos
      await DatabaseManager.instance.updateItem(matchedItem);
    } else {
      EasyLoading.showError('Ítem no encontrado en la base de datos');
      print('Ítem no encontrado en la base de datos');
    }
  }


  // Mostrar opciones de reciclaje para que el usuario seleccione una
  showRecyclingOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona la categoría de reciclaje'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: recyclingCategories.map((category) {
              return ListTile(
                title: Text(category),
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                    categorySelected = true;
                  });
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // Método para manejar el proceso de aceptar la elección del usuario
  acceptChoice(context) async {
    if (categorySelected) {
      EasyLoading.show(status: 'Actualizando...');
      await updateItem(widget.items, selectedCategory);
      EasyLoading.dismiss();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      EasyLoading.showError('Por favor, selecciona una categoría');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        backgroundColor: white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: categorySelected
                  ? Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(top: getProportionateScreenWidth(5)),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(15),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: "Categoría seleccionada: $selectedCategory\n",
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                )),
                                Text.rich(TextSpan(
                                  text:
                                      "Ahora haz clic en 'Aceptar' para confirmar.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                )),
                              ]),
                        ),
                      ]))
                  : null),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
            width: getProportionateScreenWidth(280),
            height: getProportionateScreenHeight(280),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
                image: DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.fill)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                text: "Aceptar",
                press: () async {
                  acceptChoice(context);
                },
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(30)),
            child: DefaultButton(
              text: "Seleccionar Categoría",
              press: () {
                showRecyclingOptions(); // Mostrar opciones para seleccionar categoría
              },
            ),
          ),
        ]))));
  }
}
