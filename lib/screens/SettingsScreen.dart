import 'package:deep_waste/components/profile_menu.dart';
import 'package:deep_waste/constants/app_properties.dart';
import 'package:deep_waste/database_manager.dart';
import 'package:deep_waste/models/User.dart';
import 'package:deep_waste/screens/HomeScreen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings_screen";
  final User user;
  const SettingsScreen({
    Key key,
    @required this.user
  }) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  String titsle;
  final String lorelEpsum = 'Este es un gran producto ...';
  ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future removeUser(userId) async {
    await DatabaseManager.instance.deleteUser(userId);
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
      body:  SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfileMenu(
          //   text: "Centro de Ayuda",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () async {
          //     var facebookUrl ="http://m.me/momsstorenepal";
          //     await canLaunch(facebookUrl)? launch(facebookUrl):print("Abrir enlace de la app de Facebook o mostrar un snackbar con notificación de que no está instalada la app de Facebook.");
          //   },
          // ),
          // ProfileMenu(
          //   text: "Tabla de clasificación",
          //   icon: "assets/icons/leaderboard.svg",
          //   press: () async {
          //     var leaderboardUrl ="https://momsstorenepal.com/leaderboard.html";
          //     await canLaunch(leaderboardUrl)? launch(leaderboardUrl):print("Abrir enlace del tablero de clasificación de la tienda de mamás de Nepal");
          //   },
          // ),
          ProfileMenu(
            text: "Eliminar cuenta",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await removeUser(widget.user.id);
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
                })

          
        ],
      ),
    )
    );
  }
}
