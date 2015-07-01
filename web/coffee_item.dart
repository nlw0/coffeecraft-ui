library coffeecraft.web.models;

import 'package:option/option.dart';
import 'package:polymer/polymer.dart';
import 'package:dartson/dartson.dart';
import 'package:dartson/transformers/date_time.dart';


class CoffeeItem extends Observable {
  @observable String name;
  @observable num price;

  // Constructor.
  CoffeeItem([this.name="", this.price=0]);

  CoffeeItem.fromDto(CoffeeItemDto dd) {
    name = dd.name;
    price = dd.price;
  }

  String toString() {
    return "CoffeeItem($name,$price)";
  }
}


@Entity()
class CoffeeItemDto {
  String name;
  num price;

  String toString() {
    return "CoffeeItemDto($name,$price)";
  }
}


@Entity()
class InventoryItemDto {
  num index;
  CoffeeItemDto item;
}

@Entity()
class UserStateDto {
  num money;
  List<InventoryItemDto> inventory;
}
