import 'package:deep_waste/constants/size_config.dart';
import 'package:deep_waste/controller/reward_notifier.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RewardsBanner extends StatelessWidget {
  final List<Item> items;
  const RewardsBanner({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RewardNotifier rewardNotifier = Provider.of<RewardNotifier>(context);

    // Calcular los puntos totales
    int totalPoints = items.fold(0, (sum, item) => (item.count * item.points) + sum);
    
    // Obtener la recompensa activa
    var activeReward = rewardNotifier.getActiveReward(totalPoints);

    return Container(
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
            offset: Offset(3, 3), // Cambia la posición de la sombra
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: activeReward == null || activeReward.imageURL == null
                // Si 'activeReward' es null o no tiene imagen, se usa una imagen predeterminada
                ? Image.asset('assets/images/king.png', height: 160, width: 350)
                : Image.asset(activeReward.imageURL, height: 160, width: 350),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Si 'activeReward' es null, mostramos un texto alternativo
                  Text.rich(TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: activeReward?.name ?? "¡Felicidades! Llegaste al nivel máximo, sigue contribuyendo con el planeta 🌍"),
                    ],
                  )),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Text.rich(TextSpan(
                    text: activeReward == null
                        ? "¡Gracias por tu increíble contribución!"
                        : "Has reciclado más de ${activeReward.points * 0.1} kg de huella de carbono. Te agradecemos por tu contribución. Sigue cuidando nuestro planeta y recicla para obtener más recompensas y monedas.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
