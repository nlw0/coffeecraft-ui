import 'package:polymer/polymer.dart';

import 'coffee_item.dart' show CoffeeItem;
import 'dart:html';

@CustomTag('inventory-item')
class InventoryItem extends PolymerElement {
  @published String index;
  @published CoffeeItem item;

  @published bool isChecked=false;

  InventoryItem.created() : super.created() {
  }

  void transmitState() {
    dispatchEvent(new CustomEvent("itemtoggle", detail: {"index": int.parse(index), "isChecked": isChecked}));
  }

  void doToggle() {
    if (isChecked == true)
      isChecked = false;
    else {
      isChecked = true;
    }
    transmitState();
  }
}
