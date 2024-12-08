import 'dart:ui';
import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBanner extends StatelessWidget {
  final List<Item> items;
  ProgressBanner({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RewardNotifier rewardNotifier = Provider.of<RewardNotifier>(context);
    
    // Calcular los puntos totales usando los puntos ya actualizados
    int totalPoints = items?.fold(0, (sum, item) => (item.count * item.points) + sum) ?? 0;
    var activeReward = rewardNotifier.getActiveReward(totalPoints);
    var carbonFootPrints = totalPoints * 1.08;

    // Verificar si se alcanzó el nivel máximo
    String rewardText;
    double completion = 0;

    if (activeReward == null) {
      // Mensaje de nivel máximo
      rewardText = "¡Felicidades! Lograste llegar al final";
    } else {
      // Mensaje con los puntos y cálculo del progreso
      rewardText = "$totalPoints / ${activeReward.points} Puntos";
      completion = totalPoints / activeReward.points;
    }

    return items.isEmpty
        ? Center(child: Text("Cargando"))
        : Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4A3298),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(3, 3), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Row(children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: getProportionateScreenWidth(12)),
                        children: [
                          TextSpan(
                              text:
                                  "Residuos gestionados: ${carbonFootPrints <= 0 ? 0 : getNumber(carbonFootPrints, precision: 2)} Kg CO"),
                          TextSpan(
                              text: "2 \n",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12),
                                  fontFeatures: [FontFeature.subscripts()])),
                        ],
                      )),
                      Text.rich(
                        TextSpan(
                          text: rewardText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 10),
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: completion,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff69c0dc)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    ]),
              ),
              Expanded(
                flex: 1,
                child: activeReward == null
                    ? Image.asset(
                        'assets/images/king.png', // Ruta de la imagen predeterminada
                        height: 100,
                        width: 350,
                      )
                    : Image.asset(
                        activeReward.imageURL,
                        height: 100,
                        width: 350,
                      ),
              )
              
            ]));
  }
}
