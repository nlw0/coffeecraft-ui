import 'package:polymer/polymer.dart';

import 'coffee_item.dart' show CoffeeItem;

@CustomTag('inventory-item')
class InventoryItem extends PolymerElement {
  @published CoffeeItem item;
  @published String index;

  InventoryItem.created() : super.created() {
  }
}
