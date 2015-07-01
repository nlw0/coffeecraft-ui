import 'package:polymer/polymer.dart';

import 'coffee_item.dart' show CoffeeItem;
import 'dart:html';

@CustomTag('inventory-item')
class InventoryItem extends PolymerElement {
  @published String index;
  @published CoffeeItem item;

  @published bool isChecked;

  InventoryItem.created() : super.created() {
  }

  void oonClick(Event e, var detail, Node target) {
    e.preventDefault();

    print("OI");
    print(coisa);
  }

}
