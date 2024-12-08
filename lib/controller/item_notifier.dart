import 'dart:collection';
import 'package:deep_waste/models/Item.dart';
import 'package:flutter/material.dart';

class ItemNotifier extends ChangeNotifier {
  List<Item> _items = [
    Item(
        id: "1001",
        name: "cardboard",
        imageURL: "assets/images/cardboard.png",
        count: 0,
        points: 36),
    Item(
        id: "1004",
        name: "paper",
        count: 0,
        imageURL: "assets/images/paper.png",
        points: 38),
    Item(
        id: "1002",
        name: "glass",
        count: 0,
        imageURL: "assets/images/glass.png",
        points: 3),
    Item(
        id: "1003",
        name: "metal",
        count: 0,
        imageURL: "assets/images/metal.png",
        points: 68),
    Item(
        id: "1005",
        name: "plastic",
        count: 0,
        imageURL: "assets/images/plastic.png",
        points: 18),
    Item(
        id: "1006",
        name: "trash",
        count: 2,
        imageURL: "assets/images/trash.png",
        points: 35)
  ];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Item getCollectedItem() {
    return _items.firstWhere((_item) => _item.count > 0, orElse: () => null);
  }

  void updateCount(itemName) {
    var matchedItem = _items.firstWhere(
        (_item) => _item.name.toLowerCase() == itemName,
        orElse: () => null);
    matchedItem.count = matchedItem.count + 1;
    notifyListeners();
  }
}
